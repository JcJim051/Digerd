@php
$edit = !is_null($dataTypeContent->getKey());
$add = is_null($dataTypeContent->getKey());
@endphp

@extends('voyager::master')

@section('css')
<meta name="csrf-token" content="{{ csrf_token() }}">
@stop

@section('page_title', __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular'))

@section('page_header')
<h1 class="page-title">
    <i class="{{ $dataType->icon }}"></i>
    {{ __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular') }}
</h1>
@include('voyager::multilingual.language-selector')
@stop

@section('content')
<div class="page-content edit-add container-fluid">
    <div class="row">
        <div class="col-md-12">

            <div class="panel panel-bordered">
                <!-- form start -->
                <form role="form" class="form-edit-add" action="{{ $edit ? route('voyager.'.$dataType->slug.'.update', $dataTypeContent->getKey()) : route('voyager.'.$dataType->slug.'.store') }}" method="POST" enctype="multipart/form-data">
                    <!-- PUT Method if we are editing -->
                    @if($edit)
                    {{ method_field("PUT") }}
                    @endif

                    <!-- CSRF TOKEN -->
                    {{ csrf_field() }}

                    <div class="panel-body">

                        @if (count($errors) > 0)
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                        @endif

                        <!-- Adding / Editing -->
                        @php
                        $dataTypeRows = $dataType->{($edit ? 'editRows' : 'addRows' )};
                        @endphp

                        @foreach($dataTypeRows as $row)
                        <!-- GET THE DISPLAY OPTIONS -->
                        @php
                        $display_options = $row->details->display ?? NULL;
                        if ($dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')}) {
                        $dataTypeContent->{$row->field} = $dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')};
                        }
                        @endphp
                        @if (isset($row->details->legend) && isset($row->details->legend->text))
                        <legend class="text-{{ $row->details->legend->align ?? 'center' }}" style="background-color: {{ $row->details->legend->bgcolor ?? '#f0f0f0' }};padding: 5px;">{{ $row->details->legend->text }}</legend>
                        @endif

                        <div class="form-group @if($row->type == 'hidden') hidden @endif col-md-{{ $display_options->width ?? 12 }} {{ $errors->has($row->field) ? 'has-error' : '' }}" @if(isset($display_options->id)){{ "id=$display_options->id" }}@endif>
                            {{ $row->slugify }}
                            <label class="control-label" for="name">{{ $row->getTranslatedAttribute('display_name') }}</label>
                            @include('voyager::multilingual.input-hidden-bread-edit-add')
                            @if (isset($row->details->view))
                            @include($row->details->view, ['row' => $row, 'dataType' => $dataType, 'dataTypeContent' => $dataTypeContent, 'content' => $dataTypeContent->{$row->field}, 'action' => ($edit ? 'edit' : 'add'), 'view' => ($edit ? 'edit' : 'add'), 'options' => $row->details])
                            @elseif ($row->type == 'relationship')
                            @include('voyager::formfields.relationship', ['options' => $row->details])
                            @else
                            {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                            @endif

                            @foreach (app('voyager')->afterFormFields($row, $dataType, $dataTypeContent) as $after)
                            {!! $after->handle($row, $dataType, $dataTypeContent) !!}
                            @endforeach
                            @if ($errors->has($row->field))
                            @foreach ($errors->get($row->field) as $error)
                            <span class="help-block">{{ $error }}</span>
                            @endforeach
                            @endif
                        </div>
                        @endforeach

                    </div><!-- panel-body -->

                    <div class="panel-footer">
                        @section('submit-buttons')
                        <button type="submit" class="btn btn-primary save">{{ __('voyager::generic.save') }}</button>
                        @stop
                        @yield('submit-buttons')
                    </div>
                </form>
                @if ($edit)

<div class="panel">

<div class="page-content settings container-fluid">
    <ul class="nav nav-tabs">
            <li class="active">
                <a data-toggle="tab" href="#acciones">Acciones Adelantadas</a>
            </li>
            <li>
                <a data-toggle="tab" href="#inversiones">Inversiones</a>
            </li>
            <li>
                <a data-toggle="tab" href="#personasaf">Personas Afectadas</a>
            </li>
    </ul>

    <div class="tab-content">
            <div id="acciones" class="tab-pane fade in active ">
                <div class="panel-heading">
                <h3 class="panel-title">
                    Acciones Adelantadas</h3>
                </div>
                                <table id="dataTable" class="table table-hover dataTable no-footer" role="grid" aria-describedby="dataTable_info">
                                    <thead>
                                        <tr role="row">
                                            <th>
                                            Tipo de actividad
                                            </th>
                                            <th>
                                            Entidad
                                            </th>
                                            <th>
                                            Fecha
                                            </th>
                                            <th>
                                            Personas Involucradas
                                            </th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($detalle as $d)
                                        <tr role="row" class="odd">
                                            <td>
                                            <p>{{$d->tipos_actividad->descripcion}}</p>
                                            </td>
                                            <td>
                                            <p>{{$d->entidad->nombre}}</p>
                                            </td>
                                            <td>
                                            <p>{{$d->fecha}}</p>
                                            </td>
                                            <td>
                                            <p>{{$d->personas_involucradas}}</p>
                                            </td>

                                        </tr>
                                    @endforeach    
                                    </tbody>
                                </table>
                                <p>
                                <form method="post" action="{{route('addaccion')}}">
                                <h3>Agregar accion adelantada</h3>
                                
                                <div class="form-group  col-md-12 ">
                                    <label class="control-label" for="tipoactividad">Tipo de actividad</label>
                                <select class="select2" name="tipoactividad">
                                @foreach($tiposactividad as $tipoactividad)
                                <option value="{{$tipoactividad->id_tipo_actividad}}">{{$tipoactividad->descripcion}} 
                                    </option>
                                @endforeach
                                </select>
                                </div>
                                <div class="form-group  col-md-12 ">
                                    <label class="control-label" for="entidad">Entidad</label>
                                <select class="select2" name="entidad">
                                @foreach($entidades as $entidad)
                                <option value="{{$entidad->id_entidad}}">{{$entidad->nombre}} 
                                    </option>
                                @endforeach
                                </select>
                                </div>
                                <div class="form-group  col-md-12 ">
                                    <label class="control-label" for="fecha">Fecha</label>
                                <input type="date"  class="form-control" id="fecha" name="fecha" placeholder="fecha">
                                </div>
                                <div class="form-group  col-md-12 ">
                                    <label class="control-label" for="personas">Personas involucradas</label>
                                <input type="number" min="0"  class="form-control" id="personas" name="personas" placeholder="Cantidad de personas" value="1">
                                </div>
                                <input type="hidden" name="id_emergencia" value="{{$dataTypeContent->id_emergencia}}">
                                @csrf
                                <button type="submit" class="btn btn-primary save">Agregar</button>
                            
                                </form>
                                </p>
                      
            </div>
          
            <div id="inversiones" class="tab-pane fade in ">
                <div class="panel-heading">
                <h3 class="panel-title">
                    Inversiones</h3>
                </div>
                <table id="dataTable" class="table table-hover dataTable no-footer" role="grid" aria-describedby="dataTable_info">
                                    <thead>
                                        <tr role="row">
                                            <th>
                                            Descripcion
                                            </th>
                                            <th>
                                            Valor
                                            </th>
                                            <th>
                                            Fecha
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($inversiones as $d)
                                        <tr role="row" class="odd">
                                            <td>
                                            <p>{{$d->descripcion}}</p>
                                            </td>
                                            <td>
                                            <p>{{$d->valor}}</p>
                                            </td>
                                            <td>
                                            <p>{{$d->fecha}}</p>
                                            </td>

                                        </tr>
                                    @endforeach    
                                    </tbody>
                                </table>
                                <p>
                                <form method="post" action="{{route('addinversion')}}">
                                <h3>Agregar Inversion</h3>
                                
                                <div class="form-group  col-md-12 ">
                                    <label class="control-label" for="descripcion">Descripcion</label>
                                 <textarea name="descripcion"  class="form-control" ></textarea>
                                </div>
                                <div class="form-group  col-md-12 ">
                                    <label class="control-label" for="valor">Valor</label>
                                <input type="number" min="0"  class="form-control" id="valor" name="valor" placeholder="valor en pesos" value="0">
                                </div>

                                <div class="form-group  col-md-12 ">
                                    <label class="control-label" for="fecha">Fecha</label>
                                <input type="date"  class="form-control" id="fecha" name="fecha" placeholder="fecha">
                                </div>
                                <input type="hidden" name="id_emergencia" value="{{$dataTypeContent->id_emergencia}}">
                                @csrf
                                <button type="submit" class="btn btn-primary save">Agregar</button>
                            
                                </form>
                                </p>
            </div>

            <div id="personasaf" class="tab-pane fade in ">
                <div class="panel-heading">
                <h3 class="panel-title">
                    Personas Afectadas</h3>
                </div>
                <table id="dataTable" class="table table-hover dataTable no-footer" role="grid" aria-describedby="dataTable_info">
                                    <thead>
                                        <tr role="row">
                                            <th>
                                            Fecha Registro
                                            </th>
                                            <th>
                                            Hombres
                                            </th>
                                            <th>
                                            Mujeres
                                            </th>
                                            <th>
                                            Niños
                                            </th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($personas as $d)
                                        <tr role="row" class="odd">
                                            <td>
                                            <p>{{$d->fecha}}</p>
                                            </td>
                                            <td>
                                            <p>{{$d->hombres}}</p>
                                            </td>
                                            <td>
                                            <p>{{$d->mujeres}}</p>
                                            </td>
                                            <td>
                                            <p>{{$d->ninos}}</p>
                                            </td>

                                        </tr>
                                    @endforeach    
                                    </tbody>
                                </table>
                                <p>
                                <form method="post" action="{{route('addpersona')}}">
                                <h3>Agregar Personas Afectadas</h3>
                                <div class="form-group  col-md-12 ">
                                    <label class="control-label" for="fecha">Fecha</label>
                                <input type="date"  class="form-control" id="fecha" name="fecha" placeholder="fecha">
                                </div>
                                <div class="form-group  col-md-12 ">
                                    <label class="control-label" for="hombres">Hombres</label>
                                <input type="number" min="0"  class="form-control" id="hombres" name="hombres" placeholder="hombres" value="0">
                                </div>
                                <div class="form-group  col-md-12 ">
                                    <label class="control-label" for="mujeres">Mujeres</label>
                                <input type="number" min="0"  class="form-control" id="mujeres" name="mujeres" placeholder="hombres" value="0">
                                </div>
                                <div class="form-group  col-md-12 ">
                                    <label class="control-label" for="ninos">Niños</label>
                                <input type="number" min="0"  class="form-control" id="ninos" name="ninos" placeholder="Niños" value="0">
                                </div>

                                <input type="hidden" name="id_emergencia" value="{{$dataTypeContent->id_emergencia}}">
                                @csrf
                                <button type="submit" class="btn btn-primary save">Agregar</button>
                            
                                </form>
                                </p>
            </div>
     </div>
</did>     
</did>         
                @endif
                <iframe id="form_target" name="form_target" style="display:none"></iframe>
                <form id="my_form" action="{{ route('voyager.upload') }}" target="form_target" method="post" enctype="multipart/form-data" style="width:0;height:0;overflow:hidden">
                    <input name="image" id="upload_file" type="file" onchange="$('#my_form').submit();this.value='';">
                    <input type="hidden" name="type_slug" id="type_slug" value="{{ $dataType->slug }}">
                    {{ csrf_field() }}
                </form>

            </div>
        </div>
    </div>
</div>

<div class="modal fade modal-danger" id="confirm_delete_modal">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"><i class="voyager-warning"></i> {{ __('voyager::generic.are_you_sure') }}</h4>
            </div>

            <div class="modal-body">
                <h4>{{ __('voyager::generic.are_you_sure_delete') }} '<span class="confirm_delete_name"></span>'</h4>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                <button type="button" class="btn btn-danger" id="confirm_delete">{{ __('voyager::generic.delete_confirm') }}</button>
            </div>
        </div>
    </div>
</div>
<!-- End Delete File Modal -->
@stop

@section('javascript')
<script>
    var params = {};
    var $file;

    function deleteHandler(tag, isMulti) {
        return function() {
            $file = $(this).siblings(tag);

            params = {
                slug: '{{ $dataType->slug }}',
                filename: $file.data('file-name'),
                id: $file.data('id'),
                field: $file.parent().data('field-name'),
                multi: isMulti,
                _token: '{{ csrf_token() }}'
            }

            $('.confirm_delete_name').text(params.filename);
            $('#confirm_delete_modal').modal('show');
        };
    }

    $('document').ready(function() {
        $('.toggleswitch').bootstrapToggle();

        //Init datepicker for date fields if data-datepicker attribute defined
        //or if browser does not handle date inputs
        $('.form-group input[type=date]').each(function(idx, elt) {
            if (elt.hasAttribute('data-datepicker')) {
                elt.type = 'text';
                $(elt).datetimepicker($(elt).data('datepicker'));
            } else if (elt.type != 'date') {
                elt.type = 'text';
                $(elt).datetimepicker({
                    format: 'L',
                    extraFormats: ['YYYY-MM-DD']
                }).datetimepicker($(elt).data('datepicker'));
            }
        });

        @if($isModelTranslatable)
        $('.side-body').multilingual({
            "editing": true
        });
        @endif

        $('.side-body input[data-slug-origin]').each(function(i, el) {
            $(el).slugify();
        });

        $('.form-group').on('click', '.remove-multi-image', deleteHandler('img', true));
        $('.form-group').on('click', '.remove-single-image', deleteHandler('img', false));
        $('.form-group').on('click', '.remove-multi-file', deleteHandler('a', true));
        $('.form-group').on('click', '.remove-single-file', deleteHandler('a', false));

        $('#confirm_delete').on('click', function() {
            $.post('{{ route('voyager.'.$dataType->slug.'.media.remove') }}', params, function (response) {
                    if (response &&
                        response.data &&
                        response.data.status &&
                        response.data.status == 200) {

                        toastr.success(response.data.message);
                        $file.parent().fadeOut(300, function() {
                            $(this).remove();
                        })
                    } else {
                        toastr.error("Error removing file.");
                    }
                });

            $('#confirm_delete_modal').modal('hide');
        });
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
@stop