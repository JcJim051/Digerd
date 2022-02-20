<?php

namespace App\Http\Requests\Pqrsd;

use Illuminate\Foundation\Http\FormRequest;

class PqrsdRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'numeroRadicado'        => 'required|numeric',
            'fileSoporteRespuesta'  => 'required|mimes:docx,pdf|max:3000"'
        ];
    }
    
    public function messages()
    {
        return [
            'required'  => 'El campo :attribute es requerido',
            'numeric'   => 'El campo :attribute debe ser numérico',
            'mimes'     => 'Debe cargar en el campo :attribute un archivo pdf o word'
        ];
    }

    public function attributes()
    {
        return [
            'numeroRadicado'             =>'Numero de Radicado',
            'fileSoporteRespuesta'       =>'Soporte Respuesta'
        ];
    }
}
