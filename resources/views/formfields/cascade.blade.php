@php
    $dataTypeContent->{$row->field} = json_decode($dataTypeContent->{$row->field});

@endphp
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>  

<script>
//console.log(document.forms[1].id_funcionario);
function changeSelect(Selectedobject)
{
    const value=Selectedobject.value;
    selectfield=document.getElementById("{{ $row->field }}");
    $.ajax({
        type: "get",
        url: "/api/obligaciones/"+value,
        contentType: "application/json",              
        dataType: "json",
        success: function (state) {
        $("#{{ $row->field }}").empty();
        $.each(state, function () {
            $("#{{ $row->field }}").append($("<option></option>").val(this['id_obligacion']).html(this['descripcion']));
        });
     }
  });
}

</script>
<select class="form-control select2" name="{{ $row->field }}" id="{{ $row->field }}" >
    @if(isset($options))
    <?php 
        $opciones=Illuminate\Support\Facades\DB::table($options->table)->get();


    ?>
        @foreach($opciones as $opcion)
                <?php $selected = ''; ?>
            @if(is_array($dataTypeContent->{$row->field}) && in_array($opcion->{$options->return_field}, $dataTypeContent->{$row->field}))
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