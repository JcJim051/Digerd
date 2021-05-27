<?php

namespace App;


use TCG\Voyager\FormFields\SelectDropdownHandler;
class ListSelectFormField extends SelectDropdownHandler
{
    protected $codename = 'listselect';

    public function createContent($row, $dataType, $dataTypeContent, $options)
    {
        return view('formfields.listselect', [
            'row' => $row,
            'options' => $options,
            'dataType' => $dataType,
            'dataTypeContent' => $dataTypeContent
        ]);
    }
}

