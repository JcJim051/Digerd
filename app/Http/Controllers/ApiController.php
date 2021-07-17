<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Municipio2;
use App\Models\TiposEmergencia;
use Illuminate\Support\Facades\Storage;
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
            Storage::put('data.txt',$request->getContent());
            if($request->hasfile('photos'))
             {
    
                foreach($request->file('photos') as $file)
    
                {
    
                    $name = time().'.'.$file->extension();
    
                    $file->move(public_path().'/files/', $name);  
    
                    $data[] = $name;  
    
                }
    
             }
    
    
            return "ok";
        }
}
