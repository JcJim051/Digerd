<?php

namespace App\Actions;

use TCG\Voyager\Actions\AbstractAction;

class DocxAction extends AbstractAction
{
    public function getTitle()
    {
        return 'DOCX';
    }

    public function getIcon()
    {
        return 'fa fa-file-docx-o';
    }

    public function getPolicy()
    {
        return 'read';
    }

    public function getAttributes()
    {
        return [
            'class' => 'btn btn-sm btn-success pull-right',
            'target' => 'blank'
        ];
    }

    public function getDefaultRoute()
    {
        if ($this->dataType->slug == 'actas-reunion')
            return route('exportactareunion', $this->data->id_acta_reunion);
        if ($this->dataType->slug == 'informes')
            return route('exportinforme', $this->data->id_informe);
        if ($this->dataType->slug == 'proyectos')
            return route('exportproyecto', $this->data->id_proyecto);

        }
    public function shouldActionDisplayOnDataType()
    {

        if ($this->dataType->slug == 'actas-reunion' ||  $this->dataType->slug == 'informes' ||  $this->dataType->slug == 'proyectos' )
            return true;
        else
            return false;
    }
}
