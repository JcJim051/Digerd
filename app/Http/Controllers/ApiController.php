<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Municipio;
class ApiController extends Controller
{
    //
    public function municipios()
    {
        return Municipio::all();
    }
}
