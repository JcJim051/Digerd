@extends('voyager::master')
@section('css')

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin="" />
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js" integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==" crossorigin=""></script>
<style>
    #map {
        height: 800px;
    }
</style>


@endsection
@section('content')
<div class="page-content">
    @include('voyager::alerts')
    <div class="panel">
        <h1 class="page-title">
            <i class="fa fa-tachometer"></i> Tablero de Control
        </h1>

    </div>
    <div class="panel">
        <div id="exTab2" >
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#1" data-toggle="tab">Mapa de Calor</a>
                </li>
                <li><a href="#2" data-toggle="tab">Emergencias</a>
                </li>
            </ul>
            <div class="tab-content ">
                <div class="tab-pane active" id="1">
                    <div id="map"></div>
                </div>
            <div class="tab-pane" id="2">

            </div>
        </div>
    </div>
</div>
@stop




@section('javascript')

<script src="{{asset('leaflet/leaflet-heat.js')}}"></script>
<script src="{{route('heatmap')}}"></script>

<script>
    var map = L.map('map').setView([-4.1415692,-73.6493001], 12);

    var tiles = L.tileLayer('https://{s}.tile.osm.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
    }).addTo(map);
    addressPoints = addressPoints.map(function (p) { return [p[0], p[1]]; });
    
    var heat = L.heatLayer(addressPoints).addTo(map);
</script>
@stop