<?php

	//Table Base Classs
	require_once("class.fpdf_table.php");
	
	//Class Extention for header and footer	
	require_once("header_footer.inc");
	
	/**
	 * Background Color Definitions
	 */
	$bg_color1 = array(234, 255, 218);
	$bg_color2 = array(165, 250, 220);
	$bg_color3 = array(255, 252, 249);	
	$bg_color4 = array(86, 155, 225);
	$bg_color5 = array(207, 247, 239);
	$bg_color6 = array(246, 211, 207);
	$bg_color7 = array(216, 243, 228);

	
	$pdf = new pdf_usage();		
	$pdf->Open();
	$pdf->SetAutoPageBreak(true, 20);
    $pdf->SetMargins(20, 20, 20);
	$pdf->AddPage();
	$pdf->AliasNbPages(); 
		
	$pdf->SetStyle("s1","arial","",8,"118,0,3");
	$pdf->SetStyle("s2","arial","",6,"0,49,159");
	
	//default text color
	$pdf->SetTextColor(118, 0, 3);

	$pdf->MultiCellTag(100, 4, "<s1>Example 1 - Very Simple Table</s1>", 0);
	$pdf->Ln(1);
	require('example1.inc');
	
	$pdf->Ln(10);
	
	$sTxt = "<s1>Example 2 - More detailed Table</s1>\n<s2>\t- Table Align = Center\n\t- The header has multiple lines\n\t- Colspanning Example\n\t- Rowspanning Example\n\t- Text Alignments\n\t- Properties overwriting</s2>";
	
	$pdf->SetX(60);
	$pdf->MultiCellTag(100, 2.5, $sTxt, 0);
	$pdf->Ln(1);
	require('example2.inc');

	$pdf->Ln(10);
	
	$sTxt = "<s1>Example 3 - Table split end of the page</s1>\n<s2>\t- This is the table from Example 2 at the end of the page\n\t- Splitting mode = ON, you can see that the cells are splitted</s2>";
	
	$pdf->SetXY(60,215);
	$pdf->MultiCellTag(100, 2.5, $sTxt, 0);
	$pdf->Ln(1);	
	$bTableSplitMode = true;
	require('example2.inc');
	
	$pdf->Ln(10);
	
	$sTxt = "<s1>Example 4 - Table split end of the page</s1>\n<s2>\t- This is the table from Example 2 at the end of the page\n\t- Splitting mode = OFF. In this case the cells are NOT splitted</s2>";
	
	$pdf->SetXY(60,215);
	$pdf->MultiCellTag(100, 2.5, $sTxt, 0);
	$pdf->Ln(1);	
	$bTableSplitMode = false;
	require('example2.inc');

	$pdf->Output();

?>