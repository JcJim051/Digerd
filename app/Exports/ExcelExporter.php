<?php

namespace App\Exports;

// use Maatwebsite\Excel\Concerns\FromCollection;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use PhpOffice\PhpSpreadsheet\Worksheet\Drawing;
use Maatwebsite\Excel\Concerns\WithDrawings;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterSheet;
use Maatwebsite\Excel\Concerns\WithCustomStartCell;
use App\Models\Exports;
use TCG\Voyager\Models\DataType;
use App\Models\Generic;
use Illuminate\Support\Facades\DB;
class ExcelExporter implements FromCollection, WithHeadings, WithDrawings,ShouldAutoSize,WithEvents,WithCustomStartCell 
// class CustomExport implements FromCollection
{   
    public function __construct($table,$customImage)
    {
        $export = Exports::where("id_data_type","=",$table)->get();
        
        if ($export->count())
        {
         $this->table=$export[0];
        $result=DB::Select($this->table->query);
        $this->data=Generic::Hydrate($result);
        $this->title=$this->table->name;

        }
        else
        {
            $datatype=DataType::find($table);

            $this->title=$datatype->display_name_plural;
            $this->data=$datatype->model_name::all();

        }
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
    public function collection()
    {
        
        return $this->data;
    }
    public function registerEvents(): array
    {
        $this->lastrow=10+$this->data->count();
        $this->lastcolumn=count($this->headings());
        
        $this->lastcolumnstring=chr(ord('B')+$this->lastcolumn-1);
        
        return [
            AfterSheet::class    => function(AfterSheet $event)  {
                $cellRange = 'A1:W1'; // All headers
                $styleArray = [
                    'font' => [
                        'bold' => true,
                    ],
                    'borders' => [
                        'outline' => [
                            'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THICK,
                            'color' => ['argb' => 'FF45b5e6'],
                        ],
                    ],
                    'fill' => [
                        'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                        'rotation' => 90,
                        'color' => [
                            'argb' => 'FFFFFFFF',
                        ]
                    ],
                ];
                $event->sheet->getDelegate()->getStyle($cellRange)->getFont()->setSize(12); 
                $event->sheet->getDelegate()->getStyle('E2:J4')->applyFromArray($styleArray);
                $event->sheet->getDelegate()->mergeCells("E3:J3");
                $event->sheet->getDelegate()->setCellValue("E3",$this->title);
                $event->sheet->getStyle('E3')->getAlignment()->setHorizontal('center');
                $styleArray2 = [
                    'font' => [
                        'bold' => true,
                    ],
                    'borders' => [
                        'allBorders' => [
                            'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                            'color' => ['argb' => 'FF000000'],
                        ],
                    ]
                    ];
                    $styleArray3 = [
                        'borders' => [
                            'allBorders' => [
                                'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_HAIR ,
                                'color' => ['argb' => 'FF000000'],
                            ],
                        ]
                        ];
                //    dd("B10:".$this->lastcolumnstring."10");
                $event->sheet->getDelegate()->getStyle("B10:".$this->lastcolumnstring."10")->applyFromArray($styleArray2);  
                $event->sheet->getDelegate()->getStyle("B11:".$this->lastcolumnstring.$this->lastrow)->applyFromArray($styleArray3);  
                

               
            },
        ];
    }
    public function headings(): array
    {
        $result=array();

        if ($this->data->count())
       {
        $array=array_keys($this->data->first()->getAttributes());
        
        foreach($array as $key)
            $result[]=strtoupper($key);
        }
        return $result;
      
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
        $drawing->setCoordinates('B2');

        return $drawing;
    }
}
