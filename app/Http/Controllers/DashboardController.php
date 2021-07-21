<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Actividad;
use App\Models\Generic;
use App\Models\Municipio2;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
class DashboardController extends Controller
{
    //
    public function __construct()
{
    $this->middleware(function ($request, $next) {
        $this->user= Auth::user();

        return $next($request);
    });
}
    public function index()
    {
        $sql="select e.descripcion,e.id_emergencia,e.localizacion,coalesce (sum(pa.hombres+pa.mujeres+pa.ninos),0) as personas from emergencias e
        left outer join personas_afectadas pa 
        ON (pa.id_emergencia=e.id_emergencia )
        group by e.descripcion,e.id_emergencia,e.localizacion ";
        $result=DB::Select($sql);
        $municipios=Municipio2::all();
        $puntos=Generic::Hydrate($result)->all();  
      
      
        $actividades=Actividad::where("id_funcionario","=",auth()->user()->id_funcionario)->where("cumplida","=",0)->orderBy("fecha_estimada")->get();  
      return view("vendor.voyager.index",compact('actividades','puntos','municipios'));
    }
   
}
