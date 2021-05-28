@extends('voyager::master')
@section('css')

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin="" />
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js" integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==" crossorigin=""></script>
<style>
    #map {
        height: 800px;
    }

    #map2 {
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
        <div id="exTab2">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#1" data-toggle="tab" onClick="map.invalidateSize();">Emergencias</a>
                </li>
                <li><a href="#2" data-toggle="tab">Mapa de Calor</a>
                </li>
                <li><a href="#3" data-toggle="tab">Actividades <font color="#cc0000">({{count($actividades)}})</font></a>
                </li>
            </ul>
            <div class="tab-content ">
                <div class="tab-pane active" id="1">
                    <div id="map"></div>
                </div>
                <div class="tab-pane" id="2">
                    <div id="map2"></div>
                </div>
                <div class="tab-pane" id="3">
                    <a href="{{route('voyager.actividades.index')}}" class="btn btn-primary">Ver Actividades</a>

                    <table id="dataTable" class="table table-hover dataTable no-footer" role="grid" aria-describedby="dataTable_info">
                        <thead>
                            <tr role="row">
                                <th tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Actividad">
                                    Actividad
                                </th>
                                <th tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Obligacion">
                                    Obligacion
                                </th>
                                <th tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Obligacion">
                                    Fecha estimada
                                </th>
                                <th tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Obligacion">
                                    Dias de plazo
                                </th>

                            </tr>
                        </thead>
                        <tbody>
                            @foreach($actividades as $actividad)
                            <tr role="row" class="odd">
                                <td>
                                    <p> {{$actividad->descripcion}} </p>
                                </td>
                                <td>
                                    <p> {{$actividad->obligacion->descripcion}} </p>
                                </td>
                                <td>
                                    <p> {{$actividad->fecha_estimada}}</p>
                                </td>
                                <td>
                                    <p> {{\Carbon\Carbon::parse($actividad->fecha_estimada)->diffInDays()}}</p>
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

    <script src="{{asset('leaflet/leaflet-heat.js')}}"></script>
    
    <script>

var LeafIcon = L.Icon.extend({
    options: {
       iconSize:     [40, 40],
       shadowSize:   [40, 40],
       iconAnchor:   [40, 40],
       shadowAnchor: [4, 62],
       popupAnchor:  [-3, -76]
    }
  });
        var greenIcon = new LeafIcon({
            iconUrl: '{{asset('/images/marker.png')}}'
	        });
        var map = L.map('map').setView([4.1415692, -73.6493001], 12);

        var tiles = L.tileLayer('https://{s}.tile.osm.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
        }).addTo(map);
        
        
        /*addressPoints = addressPoints.map(function(p) {
            return [p[0], p[1]];
        });*/

      //  var heat = L.heatLayer(addressPoints).addTo(map);

        var map2 = L.map('map2').setView([4.1415692, -73.6493001], 15);

        var tiles2 = L.tileLayer('https://{s}.tile.osm.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
        }).addTo(map2);

        var homeTab = document.getElementById('1');
        var observer1 = new MutationObserver(function() {
            if (homeTab.style.display != 'none') {
                map.invalidateSize();
            }
        });
        observer1.observe(homeTab, {
            attributes: true
        });

        var menu1Tab = document.getElementById('2');
        var observer2 = new MutationObserver(function() {
            if (menu1Tab.style.display != 'none') {
                map2.invalidateSize();
            }
        });
        observer2.observe(menu1Tab, {
            attributes: true
        });
        var points=[];
        @foreach($puntos as $p)
        @php
        $arr = explode(",", $p->localizacion);
        $lat = $arr[0];
        $lon = $arr[1];
        
        @endphp
        points.push([{{$lat}},{{$lon}},{{$p->personas}}]);
        var marker=L.marker(L.latLng({{$lat}},{{$lon}}), {icon: greenIcon, url: '{{route('voyager.emergencias.edit',$p->id_emergencia)}}'}).bindTooltip("{{$p->descripcion}}", 
    {
        permanent: false, 
        direction: 'auto'
    }).on('click',onClickMarker).addTo(map);
        @endforeach

        function onClickMarker(e) {
            window.location.href = this.options.url;
            //window.open(this.options.url,"_self");
            //    alert(this.getLatLng());
            //control.spliceWaypoints(1, 1, e.latlng);
        };

        var heat = L.heatLayer(points).addTo(map2);
    </script>
    @stop