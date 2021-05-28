	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="{{asset('/maps/leaflet.css')}}" />

<div class="container">
		<br>
		<div class="row">
			<div class="col-md-3">
	Direccion:<input type="text" class="form-control" id="address" placeholder="Direccion">
			</div>
			<div class="col-md-3">
Latitud / Longitud:<input type="text"
              class="form-control"
              name="{{ $row->field }}"
              id="{{ $row->field }}"
              data-name="{{ $row->display_name }}"
              type="number"
              @if($row->required == 1)
               required
              @endif
                          step="any"
              readonly
              placeholder="{{ isset($options->placeholder)? old($row->field, $options->placeholder): $row->display_name }}"
              value="@if(isset($dataTypeContent->{$row->field})){{ old($row->field, $dataTypeContent->{$row->field}) }}@else{{old($row->field)}}@endif">
	</div>
		</div>
		<br>
		<div id="locationPicker" style="width: auto; height: 300px;"></div>
	</div>

<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="{{asset('/maps/leaflet.js')}}"></script>
<script src="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.js"></script>
<script src="{{asset('/maps/OSMLocationPicker.js')}}"></script>
<script>
@if(isset($dataTypeContent->{$row->field})  )

      @php  ($arr=explode(",",$dataTypeContent->{$row->field}))
      @php ($lat=$arr[0])
      @php ($lon=$arr[1])
    @else
      @php ($lat='4.1415692')
      @php ($lon='-73.6493001')
    @endif


	$(document).ready(function(){
		OSMPICKER.initmappicker({{$lat}},{{$lon}} , 300, {
			addressId: "address",
			latitudeId: "{{ $row->field }}",
			radiusId: "radius"
		});
	});
</script>
