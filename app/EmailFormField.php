<?php

namespace App;

use TCG\Voyager\FormFields\AbstractHandler;
use App\Domains;
class EmailFormField extends AbstractHandler
{
    protected $codename = 'mail';

    public function createContent($row, $dataType, $dataTypeContent, $options)
    {
	$domains = Domains::all();
//	$value=substr(strrchr($dataTypeContent, "@"), 1);
        return view('formfields.mail', [
            'row' => $row,
            'options' => $options,
            'dataType' => $dataType,
            'dataTypeContent' => $dataTypeContent,
        ],compact('domains',$domains));
    }
}
