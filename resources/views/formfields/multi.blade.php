<link href="{{asset('multiinput/css/jq.multiinput.min.css')}}" rel="stylesheet">
<textarea 
       class="form-control multi"
       name="{{ $row->field }}"
       data-name="{{ $row->display_name }}"
       @if($row->required == 1) required @endif
	>
@if(isset($dataTypeContent->{$row->field}))
{{ old($row->field, $dataTypeContent->{$row->field}) }}
@else
[]
@endif
</textarea>
<script src="{{asset('assets_reports/js/jquery.min.js')}}"></script>

<script src="{{asset('multiinput/js/jq.multiinput.min.js')}}"></script>

<script>
        $('.multi').multiInput({
            json: true,
            input: $('<div class="row inputElement">\n' +
                '<div class="multiinput-title col-xs-12">Asistente <span class="number">1</span></div>\n' +
                '<div class="form-group col-xs-6">\n' +
                '<input class="form-control" name="nombre" placeholder="Nombre" type="text">\n' +
                '</div>\n' +
				'<div class="form-group col-xs-6">\n' +
                '<input class="form-control" name="correo" placeholder="Correo" type="text">\n' +
                '</div>\n' +
				'<div class="form-group col-xs-4">\n' +
                '<input class="form-control" name="documento" placeholder="Documento" type="text">\n' +
				'</div>\n' +
				'<div class="form-group col-xs-4">\n' +
                '<input class="form-control" name="telefono" placeholder="Telefono" type="text">\n' +
				'</div>\n' +
                '<div class="form-group col-xs-4">\n' +
				'<select name="externo"><option value="Si">SI</option><option value="No">NO</option></select>\n'+
				'<label for="externo">Externo</label>\n' +
                '</div>\n' +

                '</div>\n'),
            limit: 10,
            onElementAdd: function (el, plugin) {
                console.log(plugin.elementCount);
            },
            onElementRemove: function (el, plugin) {
                console.log(plugin.elementCount);
            }
        });
</script>