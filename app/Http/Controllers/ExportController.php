<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Exports\ExcelExporter;
use Maatwebsite\Excel\Facades\Excel;
use TCG\Voyager\Models\DataType;
use App\Utils\DocumentUtil;
use App\Models\InventarioSalida;
use App\Models\Informe;
use App\Models\Actividad;
use App\Models\ActasReunion;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
class ExportController extends Controller
{
    //
    public function exportxlsx($table)
    {
        //$datatype=DataType::find($table);
       // dd($datatype->editRows);
        return Excel::download(new ExcelExporter($table,"/images/logob.png"),"download.xlsx");
    }
    public function exportdocx($id)
    {
        $inventario=InventarioSalida::find($id);
           $x=DocumentUtil::generate(
                public_path('formatos/acta_inventario.docx'),
                array(
                    'elemento' => $inventario->inventario_entrada->tipos_ayuda->descripcion,
                    'fecha' => $inventario->fecha,
                    'cantidad' => $inventario->cantidad,
                    'responsable' => $inventario->entidad->responsable,
                    'telefono' => $inventario->entidad->telefono,
                    'entidad' => $inventario->entidad->nombre
 
                ),
                true  // optional
            );
            $date=new Carbon();
            
            return response()->download($x, 'acta'.$date->format('YmdHi').'.pdf', [], 'inline');
        
    }
    public function exportinforme($id)
    {
        $informe=Informe::find($id);
        DB::enableQueryLog();
        $listactividades=Actividad::all();
        //      where("id_funcionario","=",$informe->id_funcionario)
        //->whereBetween('fecha_estimada',[$informe->inicio,$informe->fin])->get();
  
        $actividades=array();
        foreach($listactividades as $actividad)
        {
            if (isset($actividad->obligacion->descripcion))
              $obligacion=$actividad->obligacion->descripcion;
            else
              $obligacion="";  
            $actividades[]=array("actividades"=>$actividad->descripcion,"obligacion"=>$obligacion);
        }
//dd($listactividades);
           $x=DocumentUtil::generateWithTable(
                public_path('formatos/informe.docx'),
                array(
                    'cc' => $informe->funcionario->documento,
                    'elaboracion' => $informe->elaboracion,
                    'contrato' => $informe->funcionario->contrato,
                    'nombre' => $informe->funcionario->nombre,
                    'objeto' => $informe->funcionario->objeto,
                    'periodo'=> $informe->inicio.' al '.$informe->fin,
                    'observaciones' => $informe->observaciones,
                    'numero'=> $informe->numero
                    
                ),
                "actividades",                            
                $actividades,
                false // optional
            );
            $date=new Carbon();
            
            return response()->download($x, 'informe'.$date->format('YmdHi').'.docx', [], 'inline');
        
    }
    public function exportactareunion($id)
    {
        $acta=ActasReunion::find($id);
        $acta_array=$acta->toArray();
       
        $asistentes=explode("\r\n",$acta->asistentes);
        $datatable=array();
        foreach($asistentes as $asistente)
        {
            $datatable[]=array("nombre"=>$asistente);
        }
       
           $x=DocumentUtil::generateWithTable(
                public_path('formatos/acta_reunion.docx'),
                $acta_array,
                "nombre",
                $datatable,
                false  // optional
            );
            $date=new Carbon();
            
            return response()->download($x, 'acta'.$date->format('YmdHi').'.docx', []);
        
    }
}
