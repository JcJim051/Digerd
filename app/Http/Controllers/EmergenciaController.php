<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use TCG\Voyager\Http\Controllers\VoyagerBaseController;
use TCG\Voyager\Facades\Voyager;
use App\Models\TiposAyuda;
use App\Models\DetalleInventario;
use App\Models\PersonasAfectada;
use App\Models\Inversion;
use App\Models\AccionesAdelantada;
use App\Models\Actividad;
use App\Models\TiposActividad;
use App\Models\Entidad;
use Illuminate\Support\Facades\DB;
class EmergenciaController extends VoyagerBaseController
{
    //
    public function addinversion(Request $request)
    {
        $input=$request->input();
        extract($input);
        $inversion=new Inversion();
        $inversion->descripcion=$descripcion;
        $inversion->id_emergencia=$id_emergencia;
        $inversion->valor=$valor;
        $inversion->fecha=$fecha;
        $inversion->save();
        return back()->withInput();
    }
    public function addpersona(Request $request)
    {
        $persona=new PersonasAfectada();
        $input=$request->input();
        extract($input);
        $persona->fecha=$fecha;
        $persona->hombres=$hombres;
        $persona->mujeres=$mujeres;
        $persona->ninos=$ninos;
        $persona->id_emergencia=$id_emergencia;
        $persona->save();
        return back()->withInput();
    }
    public function addaccion(Request $request)
    {
        $input=$request->input();
        extract($input);
        $accion=new AccionesAdelantada();
        $accion->id_entidad=$entidad;
        $accion->id_emergencia=$id_emergencia;
        $accion->id_tipo_actividad=$tipoactividad;
        $accion->hombres=$hombres;
        $accion->mujeres=$mujeres;
        $accion->ninos=$ninos;
        
        $accion->fecha=$fecha;
        $accion->save();
        return back()->withInput();
    }
    public function edit(Request $request, $id)
    {
        
        $tiposactividad=TiposActividad::all();
        $entidades=Entidad::all();
        $detalle=AccionesAdelantada::where("id_emergencia","=",$id)->get();
        $personas=PersonasAfectada::where("id_emergencia","=",$id)->get();
        $inversiones=Inversion::where("id_emergencia","=",$id)->get();
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);
            $query = $model->query();

            // Use withTrashed() if model uses SoftDeletes and if toggle is selected
            if ($model && in_array(SoftDeletes::class, class_uses_recursive($model))) {
                $query = $query->withTrashed();
            }
            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
                $query = $query->{$dataType->scope}();
            }
            $dataTypeContent = call_user_func([$query, 'findOrFail'], $id);
        } else {
            // If Model doest exist, get data from table name
            $dataTypeContent = DB::table($dataType->name)->where('id', $id)->first();
        }

        foreach ($dataType->editRows as $key => $row) {
            $dataType->editRows[$key]['col_width'] = isset($row->details->width) ? $row->details->width : 100;
        }

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'edit');

        // Check permission
        $this->authorize('edit', $dataTypeContent);

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'edit', $isModelTranslatable);

        $view = 'voyager::bread.edit-add';

        if (view()->exists("voyager::$slug.edit-add")) {
            $view = "voyager::$slug.edit-add";
        }

        return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable','tiposactividad','entidades','detalle','personas','inversiones'));
    }
}
