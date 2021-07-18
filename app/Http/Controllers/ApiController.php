<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Municipio2;
use App\Models\TiposEmergencia;
use App\Models\Emergencia;
use App\Models\User;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Carbon;

class ApiController extends Controller
{
    //
    public function municipios()
    {
        return Municipio2::Select("id_municipio","nombre")->get();
    }
    public function tiposemergencia()
    {
        return TiposEmergencia::all();
    }
    public function postemergencia(Request $request)
    {
            extract($request->input());
            //    return $request;
            $data=Array();
            $videos=Array();
            $fotos=Array();
            if($request->hasfile('photos'))
             {
                $x="";
                foreach($request->file('photos') as $file)
                {
                    
                    $name = pathinfo($file->getClientOriginalName(),PATHINFO_FILENAME).time().'.'.$file->extension();
                    $path=public_path().'/storage/files/';
                    $fotos[]="files\/".$name;
                    $file->move($path, $name);  
                    $data[] = $name;  
                }
             }
             if($request->hasfile('video'))
             {
                    $file=$request->file("video");
                    $name = pathinfo($file->getClientOriginalName(),PATHINFO_FILENAME).time().'.'.$file->extension();
                    $path=public_path().'/storage/files/';
                    $videos[]="files\/".$name;
                    $file->move($path, $name);  
                    $data[] = $name;  
             }
            $emergencia=new Emergencia;
            $emergencia->descripcion=$description;
            $emergencia->fecha=Carbon::Now();
            $emergencia->id_municipio=$cityId;
            $emergencia->tipo_emergencia=$emergency_type;
            $emergencia->localizacion=$geolocation;
            $user=User::where("email","=",$email)->first();
            $emergencia->user_id=$user->id;
            $emergencia->estado="Registrado";
            $emergencia->movil=1;
            $emergencia->fotos=json_encode($fotos);
            $emergencia->video=json_encode($videos);
            $emergencia->save();
            $result=array();
	        $result["ok"]="ok";
                 return json_encode($result);
        }
}
