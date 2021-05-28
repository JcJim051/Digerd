<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Exports\CustomExport;
use Maatwebsite\Excel\Facades\Excel;
use TCG\Voyager\Models\DataType;
use App\Utils\DocumentUtil;
use App\Models\InventarioSalida;
use App\Models\ActasReunion;
use Illuminate\Support\Carbon;
class ExportController extends Controller
{
    //
    public function exportxlsx($table)
    {
        $datatype=DataType::find($table);
        
        return Excel::download(new CustomExport($datatype->model_name,"/images/logob.png"),"download.xlsx");
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
