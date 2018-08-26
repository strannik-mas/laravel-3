<?php

namespace Corp\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Auth;

class MenusRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return Auth::user()->canDo('EDIT_MENU');
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            //42 урок
            'title' => 'required|max:255'
        ];
    }
}
