<?php

namespace App\Utils;

class Unoconv
{
    public static function conevertDocxToPDF($filePath, $output)
    {

        $cmd = "unoconv -f pdf $filePath -o $output";
//        dd($cmd);
        return  shell_exec($cmd);
        // \PhpOffice\PhpWord\Settings::setPdfRendererPath('.');
        // \PhpOffice\PhpWord\Settings::setPdfRendererName(\PhpOffice\PhpWord\Settings::PDF_RENDERER_DOMPDF);
        // $temp = \PhpOffice\PhpWord\IOFactory::load($finalDocPath);

        // $objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($temp, 'PDF');

        // $finalDocPath = str_replace('.docx', ".pdf", $finalDocPath);
        // $objWriter->save($finalDocPath);
    }
}

