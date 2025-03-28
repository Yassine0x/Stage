<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rules\Password;

class LoginRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\Rule|array|string>
     */
    public function rules(): array
    {
        return [
            'email' => 'required|email|string',
            'password' => [
                    'required',
            ],
            'remember' => 'boolean'
        ];
    }
    public function messages()
    {
        return
        [
            'email.required'=>'champ obligatoire',
            'password.required'=>'champ obligatoire',
        ];
    }
}
