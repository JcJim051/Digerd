<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Actividad;
class DashboardController extends Controller
{
    //
    public function index()
    {
      $actividades=Actividad::where("id_funcionario","=",auth()->user()->id_funcionario)->get();  
      $count=count($actividades);
        
      return view("vendor.voyager.index",compact('count'));
    }
    public function map()
    {
        $x='var addressPoints = [
            [-37.8839, 175.3745188667, "571"],
            [-37.8869090667, 175.3657417333, "486"],
            [-37.8894207167, 175.4015351167, "807"],
            [-37.8927369333, 175.4087452333, "899"],
            [-37.90585105, 175.4453463833, "1273"],
            [-37.9064188833, 175.4441556833, "1258"],
            [-37.90584715, 175.4463564333, "1279"],
            [-37.9033391333, 175.4244005667, "1078"]]';
        return $x;
    }
    public function heatmap()
    {
        $x='var addressPoints = [
            [-37.8839, 175.3745188667, "571"],
            [-37.8869090667, 175.3657417333, "486"],
            [-37.8894207167, 175.4015351167, "807"],
            [-37.8927369333, 175.4087452333, "899"],
            [-37.90585105, 175.4453463833, "1273"],
            [-37.9064188833, 175.4441556833, "1258"],
            [-37.90584715, 175.4463564333, "1279"],
            [-37.9033391333, 175.4244005667, "1078"]]';
        return $x;    
    }
}
