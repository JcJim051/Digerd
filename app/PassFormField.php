<?php

namespace App;

use TCG\Voyager\FormFields\AbstractHandler;
use App\Domains;
class PassFormField extends AbstractHandler
{
    protected $codename = 'pass';

    public function createContent($row, $dataType, $dataTypeContent, $options)
    {

        return view('formfields.pass', [
            'row' => $row,
            'options' => $options,
            'dataType' => $dataType,
            'dataTypeContent' => $dataTypeContent,
        ]);
    }
}
