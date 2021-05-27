<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Exports\CustomExport;
use Maatwebsite\Excel\Facades\Excel;
use TCG\Voyager\Models\DataType;
use App\Utils\DocumentUtil;


class ExportController extends Controller
{
    //
    public function exportxlsx($table)
    {
        $datatype=DataType::find($table);
        return Excel::download(new CustomExport($datatype->model_name,"/images/logob.png"),"download.xlsx");
    }
}
