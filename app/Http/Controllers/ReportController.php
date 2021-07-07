<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Report;
use App\Models\Generic;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use PhpOffice\PhpSpreadsheet\Cell\Coordinate;
class ReportController extends Controller
{
    //

    public function __construct()
    {
        $this->middleware('admin.user');
    }

    public function index()
    {
      $reportes = Report::orderBy('nombre','asc')->pluck('nombre', 'reporte');
      $step=1;
      $stats=0;
      return view('Reports.index',compact('reportes','step','stats'));
    }

    public function parameters(Request $request)
    {
      $res = Report::where("reporte",$request->reporte)->first();
      $step=2;
      $campos=explode(';',$res->parametros);
      $parametros=array();
      foreach($campos as $campo)
      {
      $arr=explode('|', $campo);
      if (substr($arr[2],0,5) == "combo")
      {
            $comboitems=explode(",",$arr[2]);
            $nomtabla=substr($comboitems[0],6);
            $result=DB::Select("SELECT ".$comboitems[1].",".$comboitems[2]." FROM ".$nomtabla);
            $lista=array();
            $mostrar=$comboitems[2];
            $valor=$comboitems[1];
            foreach ($result as $opcion) {
              $lista[]=array("mostrar"=>$opcion->$mostrar,"valor"=>$opcion->$valor);
            }
            $arr[2]="combo";
         }
         else {
           $lista=array();
         }
         $fila=array("mostrar"=>$arr[1],"nombre"=>$arr[0],"tipo"=>$arr[2],"opciones"=>$lista);
         $parametros[]=$fila;
      }
      $reporte= $request->reporte;
    //  print_r($parametros);
    $stats=0;
    return view('Reports.index',compact('res','step','parametros','reporte','stats'));
    }
    public function generate(Request $request)
    {


      $res = Report::where("reporte",$request->reporte)->first();
      $step=3;
      $campos=explode(';',$res->parametros);
      $sql=$res->sql;
      $params="";
      foreach($campos as $parametro)
      {
          $arr=explode('|', $parametro);
          $sql=str_replace("[".$arr[0]."]",$request[$arr[0]],$sql);
          $params.=$arr[1]." = ".$request[$arr[0]]." ; ";
      }
      $result=DB::Select($sql);
      $data=Generic::Hydrate($result);
      $reporte= $request->reporte;
      if ($data->first())
        $attributes=$data->first()->getAttributes();
      else {
        $attributes=null;
      }
      $encoded=base64_encode($sql);
      $stats=$res->estadistica;
      return view('Reports.index',compact('res','result','step','reporte','data','attributes','params','stats','encoded'));
    }
    public function reporter($reporte,$ispdf,$parametros)
    {


      $res = Report::where("reporte",$reporte)->first();
      $this->fecha = Carbon::Now();
      $spreadsheet = new Spreadsheet();
      $sheet = $spreadsheet->getActiveSheet();
      $sheet->getPageSetup()->setFitToWidth(1);
      $sheet->getPageSetup()->setFitToHeight(0);
      $sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);
      $writer = new Xlsx($spreadsheet);
      //        $writer->save('hello world.xlsx');  
      $lastrow = 74;
      $lastcolumn = 9;
      $lastcolumnstring = chr(ord('A') + $lastcolumn);

      $drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\HeaderFooterDrawing();
      $drawing->setName('Logo');
      $drawing->setDescription('Logo Empresa');
      $drawing->setPath(public_path("images/logob.png"));
      $drawing->setHeight(90);
      $drawing->setCoordinates('A1');
      $drawing->setWorksheet($sheet);
      $cellRange = 'A1:W1'; // All headers
      $styleArray = [
          'font' => [
              'bold' => true,
          ],
          'borders' => [
              'outline' => [
                  'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THICK,
                  'color' => ['argb' => 'FF45b5e6'],
              ],
          ],
          'fill' => [
              'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
              'color' => [
                  'argb' => 'FFFFFFFF',
              ]
          ],
      ];
      $sheet->getStyle($cellRange)->getFont()->setSize(12);
      $sheet->getStyle('D2:J4')->applyFromArray($styleArray);

      $sheet->mergeCells("D3:J3");
      $sheet->setCellValue("D3", $res->nombre);
      $sheet->getStyle('D3')->getAlignment()->setHorizontal('center');
      $sheet->mergeCells("D4:J4");
      $sheet->setCellValue("D4", "Generado el:" . $this->fecha);
      $sheet->getStyle('D4')->getAlignment()->setHorizontal('center');
      $sql=base64_decode($parametros);
      $result = DB::Select($sql);
      $data = Generic::Hydrate($result);
      if ($data->first())
          $attributes=$data->first()->getAttributes();
    else 
          $attributes=null;
      $styleArray2 = [
        'font' => [
            'bold' => true,
        ],
        'borders' => [
            'allBorders' => [
                'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                'color' => ['argb' => 'FF000000'],
            ],
        ],
        'fill' => [
            'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
            'color' => [
                'argb' => 'FF45b5e6',
            ]
        ]
    ];
    $i=0;
      $fila=8;
      foreach ($attributes as $k=>$v)
      {
        $col = chr(ord('B') + $i);
        $sheet->getStyle("{$col}{$fila}:{$col}{$fila}")->applyFromArray($styleArray2);
        $sheet->setCellValue("{$col}{$fila}", strtoupper($k));
        $sheet->getStyle("{$col}{$fila}")->getAlignment()->setHorizontal('justify');
        $sheet->getStyle("{$col}{$fila}")->getAlignment()->setVertical('justify');
        $sheet->getColumnDimension(Coordinate::stringFromColumnIndex($i+1))->setAutoSize(true);
    
        $i++;
      }
      $fila=9;
      $styleArray3 = [
        'borders' => [
            'allBorders' => [
                'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_HAIR,
                'color' => ['argb' => 'FF000000'],
            ],
        ]
    ];
      foreach($data as $row)
      {
        $i=0;
        foreach ($attributes as $k=>$v)
        {
          $col = chr(ord('B') + $i);
          $sheet->getStyle("{$col}{$fila}:{$col}{$fila}")->applyFromArray($styleArray3);
          $sheet->setCellValue("{$col}{$fila}", $row->$k);
          $sheet->getStyle("{$col}{$fila}")->getAlignment()->setHorizontal('justify');
          $sheet->getStyle("{$col}{$fila}")->getAlignment()->setVertical('justify');
          $sheet->getStyle("{$col}{$fila}")->getAlignment()->setWrapText(true);
    //      if ($i==0)
          $sheet->getColumnDimension($col)->setAutoSize(true);
          $i++;
        }
        $fila++; 
      }  
      $d=Carbon::now()->format('YmdHi');
      if ($ispdf==0)
      {
        $filename = "Reporte{$reporte}{$d}.xlsx";
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="' . urlencode($filename) . '"');
        $writer->save('php://output');
    
      }
      else
      {
        $filename = "Reporte{$reporte}{$d}";
        $fpath=public_path()."/{$filename}.xlsx";
        $writer->save($fpath);
        \App\Utils\Unoconv::conevertDocxToPDF($fpath,$filename);
        $filename=$filename.".pdf";
        header('Content-Type: application/pdf');
        header('Content-Disposition: attachment; filename="' . urlencode($filename) . '"');
       // $writer->save('php://output');
    
       return response()->file($filename);
      }
     // dd(base64_decode($parametros));
    }
}
