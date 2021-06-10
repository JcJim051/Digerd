<?php

namespace App;


use TCG\Voyager\FormFields\AbstractHandler;

class CascadeFormField extends AbstractHandler
{
    protected $codename = 'cascade';

    public function createContent($row, $dataType, $dataTypeContent, $options)
    {
        return view('formfields.cascade', [
            'row' => $row,
            'options' => $options,
            'dataType' => $dataType,
            'dataTypeContent' => $dataTypeContent
        ]);
    }
}

