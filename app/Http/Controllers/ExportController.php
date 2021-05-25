<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Exports\CustomExport;
use Maatwebsite\Excel\Facades\Excel;

use App\Utils\DocumentUtil;


class ExportController extends Controller
{
    //
    public function exportxlsx($table)
    {
        $model='Models\\'.ucfirst($table);
        return Excel::download(new CustomExport($model,"/images/logob.png"),"download.xlsx");
    }
}
