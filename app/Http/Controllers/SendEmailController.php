<?php

namespace App\Http\Controllers;

use App\Mail\NotificacionesSosMeta;
use App\Models\Funcionario;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class SendEmailController extends Controller
{
    public function responsable(Request $request){
        $responsable = Funcionario::find($request->responsable);
        //dd($responsable);
        $details = [
            'title' => $request->tipo.': Nueva correspondencia PQRSD',
            'subtitle' => 'Sr(a). '.$responsable->nombre.'. Se le ha asignado una nueva correspondencia PQRSD: ' . $request->asunto,
            'body' => 'La información pqrsd suministrada es la siguiente; ' .
                'Remitente: ' . $request->nombre_remitente . ', Correo remitente: ' . $request->email_remitente.' ',
            'descripcion' => 'Recuerde que a partir del momento en que se le asignó esta correspondencia, tiene como máximo 15 días para dar una respuesta a la solicitud, atendiendo con el respectivo soporte en la plataforma. ',
            'button' => 'Ver correspondencia',
            'enlace' => url('/respuestaPQRSD')
        ];
        Mail::to($responsable->email)->send(new NotificacionesSosMeta($details));
        return "Solicitud éxitosa";
    }
}
