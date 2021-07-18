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
            Storage::put('data.txt',$request->input());
            //    return $request;
	   $data=Array();
            if($request->hasfile('photos'))
             {
                $x="";
                foreach($request->file('photos') as $file)
                {
                    
                    $name = pathinfo($file->getClientOriginalName(),PATHINFO_FILENAME).time().'.'.$file->extension();
    
                    $file->move(public_path().'/files/', $name);  

                    $data[] = $name;  
                }
             }
             if($request->hasfile('video'))
             {
                    $file=$request->file("video");
                    $name = pathinfo($file->getClientOriginalName(),PATHINFO_FILENAME).time().'.'.$file->extension();
                    $file->move(public_path().'/files/', $name);  
                    $data[] = $name;  
             }
	     Storage::put('data2.txt',$data);
	     $result=array();
	     $result["ok"]="ok";
             return json_encode($result);
        }
}
