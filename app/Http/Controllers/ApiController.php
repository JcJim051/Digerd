<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Municipio2;
class ApiController extends Controller
{
    //
    public function municipios()
    {
        return Municipio2::all();
    }
}
