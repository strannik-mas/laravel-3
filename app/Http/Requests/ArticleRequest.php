<?php

namespace Corp\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;

class ArticleRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return Auth::user()->canDo('ADD_ARTICLES');
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        //33 урок
        return [

            'title' => 'required|max:255',
            'text' => 'required',
            'category_id' => 'required|integer',
        ];
    }

    protected function getValidatorInstance()
    {
        $validator = parent::getValidatorInstance();
        //33 урок
        $validator->sometimes('alias', 'unique:articles|max:255', function ($input){

            if($this->route()->hasParameter('article')){
                $model = $this->route()->parameter('article');
                return ($model->alias !== $input->alias) && !empty($input->alias) ;
            }

            return !empty($input->alias);
        });

        return $validator;
    }
}
