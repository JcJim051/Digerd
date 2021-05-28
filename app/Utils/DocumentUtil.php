<?php

namespace App\Utils;

use PhpOffice\PhpWord\TemplateProcessor;

class DocumentUtil
{
    public static function generateTest($templateDoc,  $isPDF = false)
    {
        $phpWord = new TemplateProcessor($templateDoc);
        $values = [
            ['userId' => 1, 'userName' => 'Batman', 'userAddress' => 'Gotham City'],
            ['userId' => 2, 'userName' => 'Superman', 'userAddress' => 'Metropolis'],
        ];
        $phpWord->cloneRowAndSetValues('userId', $values);
        $fnDOwnload = "filegenerated_".date('YmdHis').rand(0,1000);

        $finalDocPath = base_path() . "/public/$fnDOwnload.docx";
        $phpWord->saveAs($finalDocPath);
        if ($isPDF) {

            $finalPDFPath = str_replace('.docx', ".pdf", $finalDocPath);
            Unoconv::conevertDocxToPDF($finalDocPath, $finalPDFPath);
            $finalPath =  $finalPDFPath;
        }
        $finalPath = $finalDocPath;
        return $finalPath;
    }
    public static function generateWithTable($templateDoc, $data,$tablename,$datatable, $isPDF = false)
    {


        $phpWord = new TemplateProcessor($templateDoc);

        foreach ($data as $key => $value) {
            $phpWord->setValue($key, $value);
        }
        $phpWord->cloneRowAndSetValues($tablename, $datatable);
        // $phpWord->setImageValue("logo", array('path' => $logopath, 'width' => 200, 'ratio' => true));
        // $phpWord->setComplexBlock($grafica->tabla, $table);

        $fnDOwnload = "filegenerated_".date('YmdHis').rand(0,1000);

        $finalDocPath = base_path() . "/public/$fnDOwnload.docx";
        $phpWord->saveAs($finalDocPath);
        
        $finalPath = $finalDocPath;

        if ($isPDF) {

            $finalPDFPath = str_replace('.docx', ".pdf", $finalDocPath);
            Unoconv::conevertDocxToPDF($finalDocPath, $finalPDFPath);
            $finalPath =  $finalPDFPath;
        }

        return $finalPath;
    }

    public static function generate($templateDoc, $data, $isPDF = false)
    {


        $phpWord = new TemplateProcessor($templateDoc);

        foreach ($data as $key => $value) {
            $phpWord->setValue($key, $value);
        }
        // $phpWord->setImageValue("logo", array('path' => $logopath, 'width' => 200, 'ratio' => true));
        // $phpWord->setComplexBlock($grafica->tabla, $table);

        $fnDOwnload = "filegenerated_".date('YmdHis').rand(0,1000);

        $finalDocPath = base_path() . "/public/$fnDOwnload.docx";
        $phpWord->saveAs($finalDocPath);

        $finalPath = $finalDocPath;

        if ($isPDF) {

            $finalPDFPath = str_replace('.docx', ".pdf", $finalDocPath);
            Unoconv::conevertDocxToPDF($finalDocPath, $finalPDFPath);
            $finalPath =  $finalPDFPath;
        }

        return $finalPath;
    }
}
