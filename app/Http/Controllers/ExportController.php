<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Exports\ExcelExporter;
use Maatwebsite\Excel\Facades\Excel;
use TCG\Voyager\Models\DataType;
use App\Utils\DocumentUtil;
use App\Models\InventarioSalida;
use App\Models\DetalleInventario;
use App\Models\Informe;
use App\Models\Actividad;
use App\Models\ActasReunion;
use App\Models\Emergencia;
use App\Models\Proyecto;
use App\Models\Visita;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
class ExportController extends Controller
{
    //
    public function exportxlsx($table)
    {
        $datatype=DataType::find($table);
       // dd($datatype->editRows);
       $n=$datatype->getTranslatedAttribute('display_name_plural');

       $date=new Carbon();

       $name=$n.$date->format('YmdHi').".xlsx";
        return Excel::download(new ExcelExporter($table,"/images/logob.png"),$name);
    }
    public function exportemergencia($id)
    {
        $emergencia=Emergencia::find($id);
        $x=DocumentUtil::generateWithEmergencia(public_path('formatos/informe_emergencia.docx'),$emergencia,false);
        $date=new Carbon();
        return response()->download($x, 'informe_emergencia'.$date->format('YmdHi').'.docx', [], 'inline');
        
    }
    public function exportdocx($id)
    {
        $inventario=InventarioSalida::find($id);
        $elementos=array();
        $detalle=DetalleInventario::where("id_inventario_salida","=",$id)->get();
        $i=1;
        foreach($detalle as $d)
        {
        $elementos[]=array("detalle"=>$i,"elemento"=>$d->tipo_ayuda->descripcion,"cantidad"=>$d->cantidad);
        
        $i++;
        }
        $x=DocumentUtil::generateWithTable(
                public_path('formatos/acta_inventario.docx'),
                array(
                    'fecha' => $inventario->fecha,
                    'responsable' => $inventario->entidad->responsable,
                    'telefono' => $inventario->entidad->telefono,
                    'entidad' => $inventario->entidad->nombre
 
                ),
                "detalle",
                $elementos,
                true  // optional
            );
            $date=new Carbon();
            
            return response()->download($x, 'acta'.$date->format('YmdHi').'.pdf', [], 'inline');
        
    }
    public function exportinforme($id)
    {
        $informe=Informe::find($id);
        DB::enableQueryLog();
        $listactividades=Actividad::where("id_funcionario","=",$informe->id_funcionario)->whereBetween('fecha_estimada',[$informe->inicio,$informe->fin])->get();
  
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
       
        $asistentes=json_decode($acta->asistentes);
        //$datatable=array();
     
           $x=DocumentUtil::generateWithTableJSON(
                public_path('formatos/acta_reunion.docx'),
                $acta_array,
                "nombre",
                $asistentes,
                false  // optional
            );
            $date=new Carbon();
            
            return response()->download($x, 'acta'.$date->format('YmdHi').'.docx', []);
        
    }
    public function exportvisita($id)
    {
        $visita=Visita::find($id);
        $visita_array=$visita->toArray();
        $visita_array["municipio"]=$visita->municipio->nombre;
        $asistentes=json_decode($visita->asistentes);
        //$datatable=array();
     
           $x=DocumentUtil::generateWithTableJSON(
                public_path('formatos/acta_visita.docx'),
                $visita_array,
                "nombre",
                $asistentes,
                false  // optional
            );
            $date=new Carbon();
            
            return response()->download($x, 'acta_visita'.$date->format('YmdHi').'.docx', []);
        
    }

    public function exportproyecto($id)
    {
        $proyecto=Proyecto::find($id);
        $proyecto_array=$proyecto->toArray();
        $proyecto_array["municipio"]=$proyecto->municipio->nombre;
        $x=DocumentUtil::generate(
                public_path('formatos/proyectos.docx'),
                $proyecto_array,
                false  // optional
            );
            $date=new Carbon();
            
            return response()->download($x, 'proyecto_'.$date->format('YmdHi').'.docx', []);
        
    }

}
