<?php

namespace App\Utils;

use PhpOffice\PhpWord\TemplateProcessor;

class DocumentUtil
{

    public static function generate($templateDoc, $data, $isPDF = false)
    {


        $phpWord = new TemplateProcessor($templateDoc);

        foreach ($data as $key => $value) {
            $phpWord->setValue($key, $value);
        }
        // $phpWord->setImageValue("logo", array('path' => $logopath, 'width' => 200, 'ratio' => true));
        // $phpWord->setComplexBlock($grafica->tabla, $table);

        $fnDOwnload = "zzzz_sample_an";

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
