{{-- If this is a relationship and the method does not exist, show a warning message --}}
@if(isset($options->relationship) && !method_exists( $dataType->model_name, camel_case($row->field) ) )
    <p class="label label-warning"><i class="voyager-warning"></i> {{ __('voyager::form.field_select_dd_relationship', ['method' => camel_case($row->field).'()', 'class' => $dataType->model_name]) }}</p>
@endif
@php
$dataTypeContent->{$row->field} = json_decode($dataTypeContent->{$row->field});

if (isset($options))
   $opciones=$options->model::all();

@endphp
<select required class="form-control select2" name="{{ $row->field }}" id="{{ $row->field }}" onChange="changeSelect(this);">
    @if(isset($options))
        @foreach($opciones as $opcion)
                <?php $selected = ''; ?>

            @if(isset($dataTypeContent->{$row->field}) && $opcion->{$options->return_field}==$dataTypeContent->{$row->field})
                <?php $selected = 'selected="selected"'; ?>
            @endif
            <option value="{{ $opcion->{$options->return_field} }}" {!! $selected !!}>
                {{ $opcion->{$options->display_field} }}
            </option>
        @endforeach
    @endif
</select>
