<?php

namespace App\Utils;
use App\Models\Generic;
use App\Models\Informe;
use Illuminate\Support\Facades\DB;

class ValidarActividades
{
    public static function validar($idreporte)
    {
        $informe=Informe::find($idreporte);
        $sql="SELECT count(1) FROM actividades WHERE id_funcionario={$informe->id_funcionario}
        AND fecha_estimada between '{$informe->inicio}' AND '{$informe->fin}' and cumplida=0";
        
        $result=DB::Select($sql);
        $data=Generic::Hydrate($result);
    
        return $data->first()->count;
         
    }
}