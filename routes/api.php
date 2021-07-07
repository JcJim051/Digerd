<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post("/login",'App\Http\Controllers\ApiAuthController@login')->name('apilogin');
Route::get("/municipios",'App\Http\Controllers\ApiController@municipios')->name('apimunicipios');
Route::get("/tiposemergencia",'App\Http\Controllers\ApiController@tiposemergencia')->name('apitiposemergencia');
Route::post("/emergencia",'App\Http\Controllers\ApiController@postemergencia')->name('postemergencia');
Route::get("/obligaciones/{id}",function ($id) {
    $opciones=Illuminate\Support\Facades\DB::table("obligaciones")->where("id_funcionario","=",$id)->get();
    return $opciones;
})->name('apiobligaciones');