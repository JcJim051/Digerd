<?php

namespace App\Exports;

// use Maatwebsite\Excel\Concerns\FromCollection;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use PhpOffice\PhpSpreadsheet\Worksheet\Drawing;
use Maatwebsite\Excel\Concerns\WithDrawings;

class CustomExport implements FromView, WithDrawings
// class CustomExport implements FromCollection
{   
    public function __construct($model,$customImage)
    {
        $this->customModel =  'App\\' . $model;
        $this->customImage =  $customImage;
    }
    /**
     * @return \Illuminate\Support\Collection
     */
    // public function collection()
    // {
    //     // return User::all();
    //     return $this->customModel::all();
    // } 
    public function view(): View
    {
        return view('exports.customs', [
            'customs' =>  $this->customModel::all()
        ]);
    }
    public function startCell(): string
    {
        return 'B10';
    }
    public function drawings()
    {
        $drawing = new Drawing();
        $drawing->setName('Logo');
        $drawing->setDescription('Logo Empresa');
        $drawing->setPath(public_path($this->customImage));        
        $drawing->setHeight(90);
        $drawing->setCoordinates('A1');

        return $drawing;
    }
}
