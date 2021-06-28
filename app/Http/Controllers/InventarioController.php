<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use TCG\Voyager\Http\Controllers\VoyagerBaseController;
use TCG\Voyager\Facades\Voyager;
use App\Models\TiposAyuda;
use App\Models\DetalleInventario;
use Illuminate\Support\Facades\DB;
class InventarioController extends VoyagerBaseController
{
    //
    public function adicionar(Request $request)
    {
        $input=$request->input();
        $cantidad=$input["cantidad"];
        $inv=$input["idinventario"];
        $tipoayuda=$input["tipoayuda"];
        $tp=TiposAyuda::find($tipoayuda);
        if ($cantidad>$tp->disponible())
            return back()->withErrors(['Cantidad' => ['La cantidad de inventario es superior a la cantidad disponible.']]);
        $yaexiste=DetalleInventario::where("id_inventario_salida","=",$inv)->where("id_tipo_ayuda","=",$tipoayuda)->get();
        if ($yaexiste->first())
          return back()->withErrors(['Existe' => ['El tipo de ayuda ya se encuentra registrado.']]);
        $detalle=new DetalleInventario();
        $detalle->id_tipo_ayuda=$tipoayuda;
        $detalle->id_inventario_salida=$inv;
        $detalle->cantidad=$cantidad;
        $detalle->save();        
        return back()->withInput();
    }
    public function edit(Request $request, $id)
    {
        $tiposayuda=TiposAyuda::all();
        $detalle=DetalleInventario::where("id_inventario_salida","=",$id)->get();
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

        return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable','tiposayuda','detalle'));
    }
}
