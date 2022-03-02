<?php

use Illuminate\Support\Facades\Route;
use App\Utils\DocumentUtil;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect('/admin');
});


Route::group(['prefix' => 'admin'], function () {

    Voyager::routes();
    Route::get("/", 'App\Http\Controllers\DashboardController@index')->name('voyager.dashboard')->middleware('admin.user');;
});
Route::get("/dashboard", 'App\Http\Controllers\DashboardController@index')->name('dashobard');

Route::get('/export/{table}', 'App\Http\Controllers\ExportController@exportxlsx')->name('exportxlsx');
Route::get('/exportdoc/{id}', 'App\Http\Controllers\ExportController@exportdocx')->name('exportdocx');
Route::get('/exportemergencia/{id}', 'App\Http\Controllers\ExportController@exportemergencia')->name('exportemergencia');

Route::get('/exportinforme/{id}', 'App\Http\Controllers\ExportController@exportinforme')->name('exportinforme');
Route::get('/exportproyecto/{id}', 'App\Http\Controllers\ExportController@exportproyecto')->name('exportproyecto');
Route::get('/exportactareunion/{id}', 'App\Http\Controllers\ExportController@exportactareunion')->name('exportactareunion');
Route::get('/exportvisita/{id}', 'App\Http\Controllers\ExportController@exportvisita')->name('exportvisita');

Route::resource('reportes', 'App\Http\Controllers\ReportController');
Route::get('reportes', 'App\Http\Controllers\ReportController@index')->name('reportes');
Route::post('reportes.parameters', 'App\Http\Controllers\ReportController@parameters')->name('parameters');
Route::post('reportes.generate', 'App\Http\Controllers\ReportController@generate')->name('generate');
Route::get('reportes.reporter/{reporte}/{ispdf}/{data}', 'App\Http\Controllers\ReportController@reporter')->name('reporter');

Route::post('/addinventario', 'App\Http\Controllers\InventarioController@adicionar')->name('addinventario');
Route::post('/addaccion', 'App\Http\Controllers\EmergenciaController@addaccion')->name('addaccion');
Route::post('/addinversion', 'App\Http\Controllers\EmergenciaController@addinversion')->name('addinversion');
Route::post('/addpersona', 'App\Http\Controllers\EmergenciaController@addpersona')->name('addpersona');

Route::group(['middleware' => 'admin.user'], function () {
    Route::resource('respuestaPQRSD', 'App\Http\Controllers\Pqrsd\RespuestaController');
});

Route::get('/disponibilidad', 'App\Http\Controllers\InventarioController@disponibilidad')->name('disponibilidad');
Route::get('/generateTest', function () {

    return  DocumentUtil::generateTest(
        public_path('formatos/test.docx'),
        true  // optional
    );
});


Route::get("/site", "App\Http\Controllers\SiteController@index")->name("site");
Route::get("/site/{id}", "App\Http\Controllers\SiteController@page")->name("sitepage");
Route::get("/ayuda", function () {
    return redirect("/site");
});
