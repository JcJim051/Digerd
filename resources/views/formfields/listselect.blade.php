{{-- If this is a relationship and the method does not exist, show a warning message --}}
@if(isset($options->relationship) && !method_exists( $dataType->model_name, camel_case($row->field) ) )
    <p class="label label-warning"><i class="voyager-warning"></i> {{ __('voyager::form.field_select_dd_relationship', ['method' => camel_case($row->field).'()', 'class' => $dataType->model_name]) }}</p>
@endif
@php
$dataTypeContent->{$row->field} = json_decode($dataTypeContent->{$row->field})
@endphp
<select required class="form-control select2" name="{{ $row->field }}" id="{{ $row->field }}" onChange="changeSelect(this);">
    @if(isset($options))
    <?php 
        $opciones=$options->model::all();
    ?>
        @foreach($opciones as $opcion)
                <?php $selected = ''; ?>
            @if(is_array($dataTypeContent->{$row->field}) && in_array($opcion->{$options->display_field}, $dataTypeContent->{$row->field}))
                <?php $selected = 'selected="selected"'; ?>
            @elseif(!is_null(old($row->field)) && in_array($opcion->{$options->display_field}, old($row->field)))
                <?php $selected = 'selected="selected"'; ?>
            @endif
            <option value="{{ $opcion->{$options->return_field} }}" {!! $selected !!}>
                {{ $opcion->{$options->display_field} }}
            </option>
        @endforeach
    @endif
</select>
