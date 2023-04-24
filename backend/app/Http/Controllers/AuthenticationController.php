<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\SignupRequest;
use App\Http\Requests\LoginRequest;

class AuthenticationController extends Controller
{
    //
    public function register(SignupRequest $request)
    {
        $data = $request->validated();
        /** @var \App\Models\User $user */
        $user = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => bcrypt($data['password'])
        ]);
        $token = $user->createToken('main')->plainTextToken;
        return response([
            'user' => $user,
            'token' => $token
        ]);
    }

    public function login(LoginRequest  $request)
    {

        $credentials = $request->validated();
        $remember = $request->boolean('remember', false);

        if (!Auth::attempt($credentials, $remember)) {
            return response([
                'error' => 'The provided credentials are incorrect'
            ], 422);
        }

        $user = Auth::user();
        $token = $user->createToken('main')->plainTextToken;

        return response([
            'user' => $user,
            'token' => $token
        ]);

        // $credentials = $request->validated();
        // $remember = $credentials['remember'] ?? false;
        // unset($credentials['remember']);
        // if (!Auth::attempt($credentials, $remember)){
        //     return response([
        //         'error'=>'The Provided credentials are not correct'
        //     ],422);
        // }
        // $user =Auth::user();
        // $token = $user->createToken('main')->plainTextToken;
        // return response([
        //     'user'=>$user,
        //     'token'=>$token
        // ]);
    }

    public function logOut(Request $request)
    {
        $user = Auth::user();
        $user->currentAccessToken()->delete();

        return response([
            'success' => true
        ]);
    }
}
