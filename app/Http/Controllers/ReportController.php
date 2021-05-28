<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Report;
use App\Models\Generic;

use Illuminate\Support\Facades\DB;
class ReportController extends Controller
{
    //

    public function __construct()
    {
        $this->middleware('admin.user');
    }

    public function index()
    {
      $reportes = Report::orderBy('nombre','asc')->pluck('nombre', 'reporte');
      $step=1;
      $stats=0;
      return view('Reports.index',compact('reportes','step','stats'));
    }

    public function parameters(Request $request)
    {
      $res = Report::where("reporte",$request->reporte)->first();
      $step=2;
      $campos=explode(';',$res->parametros);
      $parametros=array();
      foreach($campos as $campo)
      {
      $arr=explode('|', $campo);
      if (substr($arr[2],0,5) == "combo")
      {
            $comboitems=explode(",",$arr[2]);
            $nomtabla=substr($comboitems[0],6);
            $result=DB::Select("SELECT ".$comboitems[1].",".$comboitems[2]." FROM ".$nomtabla);
            $lista=array();
            $mostrar=$comboitems[2];
            $valor=$comboitems[1];
            foreach ($result as $opcion) {
              $lista[]=array("mostrar"=>$opcion->$mostrar,"valor"=>$opcion->$valor);
            }
            $arr[2]="combo";
         }
         else {
           $lista=array();
         }
         $fila=array("mostrar"=>$arr[1],"nombre"=>$arr[0],"tipo"=>$arr[2],"opciones"=>$lista);
         $parametros[]=$fila;
      }
      $reporte= $request->reporte;
    //  print_r($parametros);
    $stats=0;
    return view('Reports.index',compact('res','step','parametros','reporte','stats'));
    }
    public function generate(Request $request)
    {


      $res = Report::where("reporte",$request->reporte)->first();
      $step=3;
      $campos=explode(';',$res->parametros);
      $sql=$res->sql;
      $params="";
      foreach($campos as $parametro)
      {
          $arr=explode('|', $parametro);
          $sql=str_replace("[".$arr[0]."]",$request[$arr[0]],$sql);
          $params.=$arr[1]." = ".$request[$arr[0]]." ; ";
      }
      $result=DB::Select($sql);
      $data=Generic::Hydrate($result);
      $reporte= $request->reporte;
      if ($data->first())
        $attributes=$data->first()->getAttributes();
      else {
        $attributes=null;
      }
      $stats=$res->estadistica;
      return view('Reports.index',compact('res','result','step','reporte','data','attributes','params','stats'));
    }
}
