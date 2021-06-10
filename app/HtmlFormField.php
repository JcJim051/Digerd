<?php

namespace App;

use TCG\Voyager\FormFields\AbstractHandler;
use App\Domains;
class HtmlFormField extends AbstractHandler
{
    protected $codename = 'html';

    public function createContent($row, $dataType, $dataTypeContent, $options)
    {

        return view('formfields.html', [
            'row' => $row,
            'options' => $options,
            'dataType' => $dataType,
            'dataTypeContent' => $dataTypeContent,
        ]);
    }
}
