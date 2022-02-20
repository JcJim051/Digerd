<?php

namespace App\Http\Controllers\Pqrsd;

use App\Http\Controllers\Controller;
use App\Http\Requests\Pqrsd\PqrsdRequest;
use App\Models\Pqrsd;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class RespuestaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $sesion = Auth::user();
        $pqrsds = DB::table('users')
        ->join('funcionarios', 'users.id_funcionario', '=', 'funcionarios.id_funcionario')
        ->join('pqrsd', 'pqrsd.responsable', '=', 'funcionarios.id_funcionario')
        ->select('users.*', 'funcionarios.*', 'pqrsd.*')
        ->where('users.id', $sesion->id)
        // ->whereNull('nomina_id')
        ->get();
        // dd($pqrsds);
        return view('pqrsd.index', compact('pqrsds'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $pqrsd    = Pqrsd::find($id);
        return view('pqrsd.update', compact('pqrsd'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(PqrsdRequest $request, $id)
    {        
        $pqrsd = Pqrsd::find($id);
        $filename = "";
        if($archivo = $request->file('fileSoporteRespuesta')){
            $destinoXls = 'pqrsds/' . date('FY') . '/';
            $profile  = time() . '.' . $archivo->getClientOriginalExtension();
            $filename = $destinoXls . $profile ;
            $archivo->move('storage/' . $destinoXls, $profile);
        };
        $pqrsd->num_radicado        = $request->numeroRadicado;
        $pqrsd->soporte_respuesta   =  $request->$filename;
        $pqrsd->save();
        $notification = array(
            'message' => 'PQRSD Finalizado exitosamente!',
            'alert-type' => 'success'
        );
        return redirect('respuestaPQRSD')->with($notification);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
