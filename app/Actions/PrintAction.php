<?php

namespace App\Actions;

use TCG\Voyager\Actions\AbstractAction;

class PrintAction extends AbstractAction
{
    public function getTitle()
    {
        return 'PDF';
    }

    public function getIcon()
    {
        return 'fa fa-file-pdf-o';
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
        if ($this->dataType->slug == 'inventario-salida' ) 
            return route('exportdocx',$this->data->id_inventario_salida);
       
 
            
     

    }
    public function shouldActionDisplayOnDataType()
    {
                
        if ($this->dataType->slug == 'inventario-salida'   ) 
            return true;
        else
            return false;

    }

}