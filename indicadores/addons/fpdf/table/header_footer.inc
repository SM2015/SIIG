<?php

/**
 * Class extention for Header and Footer Definitions
 *
 */
class pdf_usage extends fpdf_table
{
	
	public function Header()
	{
		$this->SetStyle("head1","arial","",6,"160,160,160");
		$this->SetStyle("head2","arial","",6,"0,119,220");
		
	    $this->SetY(10);
	    
	    $this->MultiCellTag(100, 3, "<head1>FPDF Table (Fpdf Add On)\nAuthor:</head1><head2 href='mailto:andy@interpid.eu'> Bintintan Andrei, Interpid Team</head2>");
	    
	    $this->Image('images/interpid_logo.png', 160, 10, 40, 0, '', 'http://www.interpid.eu');

	    $this->SetY($this->tMargin);
	}	
	
	public function Footer()
	{
	    $this->SetY(-10);
	    $this->SetFont('Arial','I',7);
	    $this->SetTextColor(170, 170, 170);
	    $this->MultiCell(0, 4, "Page {$this->PageNo()} / {nb}", 0, 'C');
	}
} 

?>