@php
$keys = $customs[0]->getFillable();

@endphp

<table>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>

    <tr>
        @foreach ($keys as $th)
        <th><b>{{strtoupper($th)}}</b></th>
        @endforeach
    </tr>
    @foreach($customs as $custom)
    
    <tr>
        @foreach($keys as $key)
        <td>{{$custom->$key}}</td>
        @endforeach
    </tr>
    @endforeach
</table>