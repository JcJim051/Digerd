<input 
       class="form-control"
       name="{{ $row->field }}"
       data-name="{{ $row->display_name }}"
       type="text"
       @if($row->required == 1) required @endif
			 step="any"
       placeholder="{{ isset($options->placeholder)? old($row->field, $options->placeholder): $row->display_name }}"
       value="@if(isset($dataTypeContent->{$row->field})){{ old($row->field, strtok($dataTypeContent->{$row->field},"@")) }}@else{{old($row->field)}}@endif">

