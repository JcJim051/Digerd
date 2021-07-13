@extends('disponibilidad.master')
@section('head')

<!-- page specific plugin styles -->

<!--[if lte IE 9]>
    <link rel="stylesheet" href="assets_reports/css/ace-ie.min.css" />
  <![endif]-->

<!--[if lte IE 9]>
  <link rel="stylesheet" href="assets_reports/css/ace-ie.min.css" />
<![endif]-->

<!-- inline styles related to this page -->

@endsection

@section('content')

<div class="row">

  <section class="content">

    <div class="container-fluid">
      <div class="side-body padding-top">
        <h1 class="page-title">
          <i class="fa fa-stack-exchange "></i>
         Ayudas disponibles
        </h1>
        <div class="row">
          <div class="col-md-12">


            <div class="panel panel-bordered">
              <!-- form start -->
              <div class="col-sm-12">
                <table id="dataTable" class="table table-hover dataTable no-footer" role="grid" aria-describedby="dataTable_info">
                  <thead>
                  
                    <tr role="row">
                      <th  tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Tipo de Ayuda">
                        Tipo de Ayuda
                      </th>
                      <th tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Cantidad">
                       Cantidad Disponible
                      </th>
                      <th tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Cantidad">
                       Total Entradas
                      </th>
                      <th tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Cantidad">
                       Total Salidas
                      </th>
                      

                    </tr>
                  </thead>
                  <tbody>

                  @foreach ($v as $d)

                    <tr role="row" class="
                    @if ($loop->iteration%2==0) 
                    odd
                    else
                    even
                    ">
                      <td>
                        <div>{{$d->descripcion}}</div>
                      </td>
                      <td>
                        <div>{{$d->disponible}}</div>
                      </td>
                      <td>
                        <div>{{$d->entrada}}</div>
                      </td>
                      <td>
                        <div>{{$d->salida}}</div>
                      </td>
                     
                     </tr>
                     @endforeach
                  </tbody>
                </table>
              </div>

            </div>
          </div>
        </div>
      </div>
  </section>
</div>

@endsection
@section('javascript')


@endsection