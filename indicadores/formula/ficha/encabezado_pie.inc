<?php

/**
 * Class extention for Header and Footer Definitions
 *
 */
class pdf_usage extends fpdf_table
{
	
	public function Header()
	{
		$this->SetStyle("head1","arial","",8,"0,0,0");
		$this->SetStyle("head2","arial","",8,"0,0,0");
                $this->SetStyle("head3","arial","",8,"0,0,0");
		
	    $this->SetY(10);
	    
	    $this->MultiCellTag(100, 3, "<head1> MINISTERIO DE SALUD</head1>");
	    $this->MultiCellTag(100, 3, "<head2> SISTEMA DE INFORMACION GERENCIAL</head2>");
            $this->MultiCellTag(100, 3, "<head3> FICHA TECNICA DE INDICADOR</head3>");
	    $this->Image('../../lib/salu.png', 165, 5, 20, 0, '', 'http://www.salud.gob.sv/');

	    $this->SetY($this->tMargin);
	}	
	
	public function Footer()
	{
	    $this->SetY(-10);
	    $this->SetFont('Arial','I',7);
	    $this->SetTextColor(170, 170, 170);
	    $this->MultiCell(0, 4, "Pagina {$this->PageNo()} / {nb}", 0, 'C');
	}
} 

?>