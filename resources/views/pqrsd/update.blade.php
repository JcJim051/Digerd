@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class="voyager-sound" aria-hidden="true"></i>
        Respuesta de PQRSD
    </h1>
@endsection

@section('content')
    <div class="col-md-12">
        <div class="panel panel-bordered">
            <div class="panel-body">
                <form enctype="multipart/form-data" action="{{ url('respuestaPQRSD/'.$pqrsd->id_pqrsd)}}" method="post" >
                    {!! method_field('PUT') !!}
                    <div>
                        @if ($errors->any())
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all('<li>:message</li>') as $message)
                                        {!! $message !!}
                                    @endforeach
                                </ul>
                            </div>
                        @endif
                    </div>
                    @csrf
                    <fieldset>
                        <legend>DATOS DEL REMITENTE DEL PQRSD</legend>
                        <div class="form-group  col-md-12 ">
                            <label class="control-label" for="forNombreRemitente">Nombre del Remitentente</label>
                            <input type="text" class="form-control" name="nombreRemitente" id="nombreRemitente" value="{{ $pqrsd->nombre_remitente }}" readonly>
                        </div>
                        <div class="form-group  col-md-6 ">
                            <label class="control-label" for="forTelefono">Telefono</label>
                            <input type="text" class="form-control" name="telefono" id="telefono" value="{{ $pqrsd->telefono }}" readonly>
                        </div>
                        <div class="form-group  col-md-6 ">
                            <label class="control-label" for="forCorreo">Correo</label>
                            <input type="text" class="form-control" name="correo" id="correo" value="{{ $pqrsd->email_remitente }}" readonly>
                        </div>
                    </fieldset>
                    <fieldset>
                        <legend>DATOS DEL PQRSD</legend>
                        <div class="form-group  col-md-3 ">
                            <label class="control-label" for="forNumeroOficio">Numero del Oficio</label>
                            <input type="text" class="form-control" name="numeroOficio" id="numeroOficio" value="{{ $pqrsd->num_oficio }}" readonly>
                        </div>
                        <div class="form-group  col-md-3 ">
                            <label class="control-label" for="forAsunto">Asunto</label>
                            <input type="text" class="form-control" name="asunto" id="asunto" value="{{ $pqrsd->asunto }}" readonly>
                        </div>
                        <div class="form-group  col-md-3 ">
                            <label class="control-label" for="forFechaAsignacion">Fecha Asignación</label>
                            <input type="text" class="form-control" name="fechaAsignacion" id="fechaAsignacion" value="{{ $pqrsd->fecha_asignacion }}"readonly>
                        </div>
                        <div class="form-group  col-md-3 ">
                            <label class="control-label" for="forVerSoporte">Ver Soporte</label><br>
                            <a href="{{ Storage::disk(config('voyager.storage.disk'))->url(json_decode($pqrsd->soporte_solicitud)['0']->download_link) ?: '' }}" title="Soporte" target="_blank" class="btn btn-sm btn-warning view">  
                                <i class="voyager-eye"></i> <span class="hidden-xs hidden-sm">Soporte</span>
                            </a>
                        </div>
                    </fieldset>                     
                    <fieldset>                       
                        <legend>CARGA DE INFORME</legend>
                        <div class="form-group  col-md-12 ">
                            <label for="forNumeroRadicado">Numero de Radicado</label>
                            <input type="number" class="form-control" name="numeroRadicado" id="numeroRadicado" required="" step="any" placeholder="Numero de Radicado" value="">
                        </div>
                        <div class="form-group  col-md-12 ">
                            <label class="control-label" for="forSoporteRespuesta">Soporte Respuesta</label>
                            <input type="file" class="form-control" name="fileSoporteRespuesta" id="fileSoporteRespuesta" accept=".docx, .pdf" />
                        </div>
                        <div class="form-group  col-md-12 ">
                            <button type="submit" class="btn btn-primary save">Finalizar</button>
                            <a href="{{ route('respuestaPQRSD.index') }}" title="cancelar" class="btn btn-danger pull-right">
                                Cancelar
                            </a>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
@endsection
@section('javascript')
    <script src="{{ asset('js/jsRegalias/gestion/scriptEdit.js') }}"></script>
@endsection