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
                <div class="table-responsive">
                    <table id="dataTableRespuestaPQRSD" name="dataTableRespuestaPQRSD" class="dataTables_wrapper form-inline dt-bootstrap no-footer" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th class="dt-not-orderable">
                                    <input type="checkbox" class="select_all">
                                </th>
                                <th class="text-center">Numero del radicado</th>
                                <th class="text-center">Nombre del Remitente</th>
                                <th class="text-center">Asunto</th>
                                <th class="text-center">Tipo</th>
                                <th class="text-center">Fecha Creación</th>
                                <th class="text-center">Fecha Asignación</th>
                                <th class="text-center">Soporte</th>
                                <th class="text-center">Acciones</th> 
                            </tr>
                        </thead>
                        <tbody>
                        @foreach ($pqrsds as $pqrsd)
                            <tr role="row">
                                <td>
                                    <input type="checkbox" name="row_id[]" class="checkPQRSD"
                                        id="checkbox_{{ $pqrsd->id }}" value="{{ $pqrsd->id }}">
                                </td>
                                <td class="text-center">{{ $pqrsd->num_radicado }}</td>
                                <td class="text-center">{{ $pqrsd->nombre_remitente }}</td>
                                <td class="text-center">{{ $pqrsd->asunto }}</td>
                                <td class="text-center">{{ $pqrsd->tipo }}</td>
                                <td class="text-center">{{ $pqrsd->fecha_creacion }}</td>
                                <td class="text-center">{{ $pqrsd->fecha_asignacion }}</td>
                                <td class="text-center">
                                    <a href="{{ Storage::disk(config('voyager.storage.disk'))->url(json_decode($pqrsd->soporte_solicitud)['0']->download_link) ?: '' }}" title="Soporte" target="_blank" class="btn btn-sm btn-warning pull-right view">  
                                        <i class="voyager-eye"></i> <span class="hidden-xs hidden-sm">Soporte</span>
                                    </a>
                                </td>
                                <td class="text-center">
                                    @if ($pqrsd->soporte_respuesta != "[]")
                                        <button type="button" class="btn btn-success">Finalizado</button>
                                    @else
                                        <a href="{{ url('respuestaPQRSD/'.$pqrsd->id_pqrsd) }}" title="Editar" class="btn btn-sm btn-primary pull-right edit">
                                            <i class="voyager-edit"></i> <span class="hidden-xs hidden-sm">Dar Respuesta</span>
                                        </a>                                        
                                    @endif
                                    
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>  

@stop

@section('javascript')
<script type="text/javascript">
    $(document).ready( function () {
        //Pone check all campos
        $('.select_all').click(function() {
            $('.checkPQRSD').prop('checked', $(this).prop('checked'));
        });

        var table= $('#dataTableRespuestaPQRSD').DataTable({
            language: {
                "decimal": "",
                "emptyTable": "No hay información",
                "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                "infoPostFix": "",
                "thousands": ",",
                "lengthMenu": "Mostrar _MENU_ Entradas",
                "loadingRecords": "Cargando...",
                "processing": "Procesando...",
                "search": "Buscar:",
                "zeroRecords": "Sin resultados encontrados",
                "paginate": {
                    "first": "Primero",
                    "last": "Ultimo",
                    "next": "Siguiente",
                    "previous": "Anterior"
                }
            },
            columnDefs: [ {
                orderable: true,
                className: 'select-checkbox',
                targets:   0
            } ],
            select: {
                style:    'os',
                selector: 'td:first-child'
            },
            order: [[ 1, 'asc' ]]
        });
        //Pone conteo en una columna
        // table.on( 'order.dt search.dt', function () {
        //     table.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        //         cell.innerHTML = i+1;
        //     } );
        // } ).draw();
    });
</script>
@endsection