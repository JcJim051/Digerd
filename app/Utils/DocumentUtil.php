<?php

namespace App\Utils;

use PhpOffice\PhpWord\TemplateProcessor;
use App\Models\Emergencia;
use App\Models\Generic;
use tcg\Voyager\Facades\Voyager;
use Illuminate\Support\Facades\DB;

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
    public static function generateWithEmergencia($templateDoc,$emergencia,  $isPDF = false)
    {
        
        $phpWord = new TemplateProcessor($templateDoc);
        $data=array();
        $data["municipio"]=$emergencia->municipio->nombre;
        $data["id_emergencia"]=$emergencia->id_emergencia;
        $data["localizacion"]="https://maps.google.com/?q=".$emergencia->localizacion;
        $data["tipo"]=$emergencia->tipos_emergencia->descripcion;
        $data["entidad"]=$emergencia->entidad->nombre;
        $data["criticidad"]=$emergencia->criticidad;
        $data["comuna"]=$emergencia->comuna;
        $data["fuente"]=$emergencia->fuente_agua;
        $data["funcionario"]=$emergencia->funcionario->nombre;
        $data["descripcion"]=$emergencia->descripcion;
        $data["fecha"]=$emergencia->fecha;
       
        
        foreach ($data as $key => $value) {
            $phpWord->setValue($key, $value);
        }
       
        $sql="select i.descripcion as inversion,i.fecha as fechainversion,cast(i.valor as money) as valor from inversiones i WHERE i.id_emergencia=?";
        $result=DB::Select($sql,[$emergencia->id_emergencia]);
        $inversiones=Generic::Hydrate($result)->toArray();;
        //dd($inversiones);
        $phpWord->cloneRowAndSetValues('inversion', $inversiones);

        $sql="select pa.fecha  as personas,pa.hombres,pa.mujeres ,pa.ninos from personas_afectadas pa WHERE pa.id_emergencia=?";
        $result=DB::Select($sql,[$emergencia->id_emergencia]);
        $personas=Generic::Hydrate($result)->toArray();;
        $phpWord->cloneRowAndSetValues('personas', $personas);


        $sql="select ta.descripcion as actividad,aa.fecha as fechaaccion,
        e.nombre as entidad,aa.hombres as hombresa,aa.mujeres as mujeresa,aa.ninos as ninosa
        from acciones_adelantadas aa,tipos_actividad ta ,entidades e
        where aa.id_tipo_actividad = ta.id_tipo_actividad and aa.id_entidad = e.id_entidad 
        AND aa.id_emergencia=?";
        $result=DB::Select($sql,[$emergencia->id_emergencia]);
        $actividades=Generic::Hydrate($result)->toArray();;
        $phpWord->cloneRowAndSetValues('actividad', $actividades);

if (isset($emergencia->fotos))
        {
        $arr=json_decode($emergencia->fotos);
        //dd($arr);
        //dd(public_path()."/storage/".$arr[0]);
        if (count($arr)>0)
        {
            $phpWord->cloneBlock('fotos', count($arr), true, true);
            $i=1;
            foreach ($arr as $foto)
            {
                $phpWord->setImageValue("foto#$i",array('path'=>public_path()."/storage/".$foto,'width' => '10cm','height'=>'10cm','ratio'=>true));
                $i++;
            }
        }
    }
    else
    {
        $phpWord->cloneBlock('fotos', 0, true, true);

    }
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
    public static function generateWithTableJSON($templateDoc, $data,$tablename,$datatable, $isPDF = false)
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
    public static function generateWithTableImages($templateDoc, $data,$tablename,$datatable, $isPDF = false)
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
