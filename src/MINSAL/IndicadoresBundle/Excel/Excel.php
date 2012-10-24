<?php

namespace MINSAL\IndicadoresBundle\Excel;
use PHPExcel_IOFactory;
use OS\ExcelBundle\Excel\Excel as ExcelBase;

class Excel extends ExcelBase{
    protected $options = array('readOnly' => true);
    /**
     * Parse and load and spreadsheet file
     * 
     * @param string $file
     * @param array $options 
     */
    public function loadFile($file = null, $options = array()) {
        $this->options += $options;

        if (!$file)
            throw new \Symfony\Component\HttpKernel\Exception\NotFoundHttpException('Missing arguments!');

        extract($this->options);

        $this->reader = PHPExcel_IOFactory::createReader(PHPExcel_IOFactory::identify($file));
        //$this->reader->setReadDataOnly($readOnly);
        $this->phpExcel = $this->reader->load($file);

        $this->setActiveSheet();
    }

    /**
     * Active a sheet by indix
     *
     * @param int $index
     */
    public function setActiveSheet($index = 0) {
        $this->currentSheet = $this->phpExcel->setActiveSheetIndex($index);
    }

    /**
     * Return activated sheet
     * 
     * @return \PHPExcel_Worksheet
     */
    public function getSheet() {
        return $this->currentSheet;
    }

    

}

?>