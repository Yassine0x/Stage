<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateProductRequest extends FormRequest
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
            //
            'title'=>'string|max:1000',
            'image'=>'image|mimes:jpeg,png,jpg|max:2048',
            'decription'=>'string',
            'price' => 'numeric|between:0,99999.99',
            'quantity'=>'integer'

        ];
    }
}
