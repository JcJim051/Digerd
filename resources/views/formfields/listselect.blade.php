{{-- If this is a relationship and the method does not exist, show a warning message --}}
@if(isset($options->relationship) && !method_exists( $dataType->model_name, camel_case($row->field) ) )
    <p class="label label-warning"><i class="voyager-warning"></i> {{ __('voyager::form.field_select_dd_relationship', ['method' => camel_case($row->field).'()', 'class' => $dataType->model_name]) }}</p>
@endif
@php
$dataTypeContent->{$row->field} = json_decode($dataTypeContent->{$row->field})
@endphp
<select class="form-control select2" name="{{ $row->field }}[]" multiple>
    @if(isset($options->options))
    <?php 
        $options=Illuminate\Support\Facades\DB::table($options->options->tabla)->get();
        

    ?>
        @foreach($options as $opcion)
                <?php $selected = ''; ?>
            @if(is_array($dataTypeContent->{$row->field}) && in_array($opcion->nombre, $dataTypeContent->{$row->field}))
                <?php $selected = 'selected="selected"'; ?>
            @elseif(!is_null(old($row->field)) && in_array($opcion->nombre, old($row->field)))
                <?php $selected = 'selected="selected"'; ?>
            @endif
            <option value="{{ $opcion->nombre }}" {!! $selected !!}>
                {{ $opcion->descripcion }}
            </option>
        @endforeach
    @endif
</select>
