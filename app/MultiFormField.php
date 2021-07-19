<?php

namespace App;

use TCG\Voyager\FormFields\AbstractHandler;
class MultiFormField extends AbstractHandler
{
    protected $codename = 'multi';

    public function createContent($row, $dataType, $dataTypeContent, $options)
    {

        return view('formfields.multi', [
            'row' => $row,
            'options' => $options,
            'dataType' => $dataType,
            'dataTypeContent' => $dataTypeContent,
        ]);
    }
}
