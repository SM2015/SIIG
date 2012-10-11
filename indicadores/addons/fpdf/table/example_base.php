<?php

	//Table Base Classs
	require_once("class.fpdf_table.php");
	
	//Class Extention for header and footer	
	require_once("header_footer.inc");
	
	//Table Defintion File
	require_once("table_def.inc");
	
	$bg_color1 = array(234, 255, 218);
	$bg_color2 = array(165, 250, 220);
	$bg_color3 = array(255, 252, 249);	
	
	$pdf = new pdf_usage();		
	$pdf->Open();
	$pdf->SetAutoPageBreak(true, 20);
    $pdf->SetMargins(20, 20, 20);
	$pdf->AddPage();
	$pdf->AliasNbPages(); 

	$columns = 5; //five columns

	$pdf->SetStyle("p","times","",10,"130,0,30");
	$pdf->SetStyle("t1","arial","",10,"0,151,200");
	$pdf->SetStyle("size","times","BI",13,"0,0,120");
    
	$ttxt1 = "<size>Tag-Based MultiCell Table</size>\nCreated by <t1 href='mailto:andy@interpid.eu'>Bintintan Andrei, Interpid Team</t1>";
	$ttxt2 = "<p>The cells in the table are fully functional <t1>Tag Based Multicells components</t1>. The description and usage of these components can be found <t1>here</t1>.</p>";
	
	//Initialize the table class
	$pdf->tbInitialize($columns, true, true);
	
	//set the Table Type
	$pdf->tbSetTableType($table_default_table_type);
	
	//Table Header
	for($i=0; $i<$columns; $i++) $header_type[$i] = $table_default_header_type;
	
	for($i=0; $i<$columns; $i++) {
		$header_type1[$i] = $table_default_header_type;
		$header_type2[$i] = $table_default_header_type;
		
		$header_type2[$i]['T_COLOR'] = array(10,20, 100);
		$header_type2[$i]['BG_COLOR'] = $bg_color2;
	}

	$header_type1[0]['WIDTH'] = 20;
	$header_type1[1]['WIDTH'] = 30;
	$header_type1[2]['WIDTH'] = 40;
	$header_type1[3]['WIDTH'] = 40;
	$header_type1[4]['WIDTH'] = 20;

	
	$header_type1[0]['TEXT'] = "Header 1";
	$header_type1[1]['TEXT'] = "Header 2";
	$header_type1[2]['TEXT'] = "Header 3";
	$header_type1[3]['TEXT'] = "Header 4";
	$header_type1[4]['TEXT'] = "Header 5";
	
	
	$header_type2[0]['TEXT'] = "Header Line 2, Centered, Colspan";
	$header_type2[0]['COLSPAN'] = 3;
	$header_type2[0]['T_ALIGN'] = 'C';
	
	$header_type2[3]['TEXT'] = "The Header can have multiple lines";
	$header_type2[3]['COLSPAN'] = 2;
	$header_type2[3]['ROWSPAN'] = 2;
	
	$aHeaderArray = array(
		$header_type1,
		$header_type2, 
		$header_type1,
		$header_type1
	);	

	//set the Table Header
	$pdf->tbSetHeaderType($aHeaderArray, true);
	
	//Draw the Header
	$pdf->tbDrawHeader();

	//Table Data Settings
	$data_type = Array();//reset the array
	for ($i=0; $i<$columns; $i++) $data_type[$i] = $table_default_data_type;

	$pdf->tbSetDataType($data_type);
	
	$fsize = 5;
	$colspan = 2;
	$rowspan = 2;
	
	$rgb_r = 255;
	$rgb_g = 255;
	$rgb_b = 255;

	for ($j=0; $j<45; $j++)
	{
		$data = Array();
		$data[0]['TEXT'] = "Row No - $j";
		$data[0]['T_SIZE'] = $fsize;
		$data[1]['TEXT'] = "Test Text Column 1- $j";
		$data[1]['T_SIZE'] = 13 - $fsize;
		$data[2]['TEXT'] = "Test Text Column 2- $j";
		$data[3]['TEXT'] = "Longer text, this will split sometimes...";
		$data[3]['T_SIZE'] = 15 - $fsize;
		$data[4]['TEXT'] = "Short 4- $j";
		$data[4]['T_SIZE'] = 7;
			
		if ($j==0){
            $data[1]['TEXT'] = $ttxt1;
            $data[1]['COLSPAN'] = 4;
            $data[1]['T_ALIGN'] = "C";
            $data[1]['LN_SIZE'] = 5;
		}elseif ($j==1){
			
			$data[0]['TEXT'] = "Top Right Align <p>Align Top</p> Right Right Align ";
			$data[0]['T_ALIGN'] = "R";
			$data[0]['V_ALIGN'] = "T";
			
			$data[1]['TEXT'] = "Middle Center Align Bold Italic";
			$data[1]['T_ALIGN'] = "C";
			$data[1]['T_TYPE'] = "BI";
			$data[1]['V_ALIGN'] = "M";
			
			$data[2]['TEXT'] = "\n\n\n\n\nBottom Left Align";
			$data[2]['T_ALIGN'] = "L";
			$data[2]['V_ALIGN'] = "B";
			
			$data[3]['TEXT'] = "Middle Justified Align Longer text";
			$data[3]['T_ALIGN'] = "J";
			$data[3]['V_ALIGN'] = "M";
			
			$data[4]['TEXT'] = "TOP RIGHT Align";
			$data[4]['T_ALIGN'] = "R";
			$data[4]['V_ALIGN'] = "T";
		}
		
		if ($j>0){
			$data[0]['BG_COLOR'] = array(255-$rgb_b, $rgb_g, $rgb_r);
			$data[1]['BG_COLOR'] = array($rgb_r, $rgb_g, $rgb_b);
			$data[2]['BG_COLOR'] = array($rgb_b, $rgb_g, 220);
			$data[2]['T_COLOR'] = array(80, 20, $rgb_g);
		}
		
		if ($j>3 && $j<7){
			$data[1]['TEXT'] = "Colspan Example - Center Align";
			$data[1]['COLSPAN'] = $colspan;
			$data[1]['BG_COLOR'] = array($rgb_b, 50, 50);
			$data[1]['T_COLOR'] = array(255,255,$rgb_g);
			$data[1]['T_ALIGN'] = "C";
			$colspan++;
			if ($colspan>4) $colspan = 2;
		}
		
		if ($j==7){
			$data[3]['TEXT'] = "Rowspan Example";
			$data[3]['BG_COLOR'] = array($rgb_b, $rgb_b, 250);
			$data[3]['ROWSPAN'] = 4;
			
		}
		
		if ($j==8){
			$data[1]['TEXT'] = "Rowspan Example";
			$data[1]['BG_COLOR'] = array($rgb_b, 50, 50);
			$data[1]['ROWSPAN'] = 6;
		}
		
		if ($j==9){
			$data[2]['TEXT'] = "Rowspan Example";
			$data[2]['BG_COLOR'] = array($rgb_r, $rgb_r, $rgb_r);
			$data[2]['ROWSPAN'] = 3;
		}
		
		if ($j==12){
			$data[2]['TEXT'] = "Rowspan && Colspan Example\n\nCenter/Middle Allignment";
			$data[2]['T_ALIGN'] = 'C';
			$data[2]['V_ALIGN'] = 'M';
			$data[2]['BG_COLOR'] = array(234, 255, 218);
			$data[2]['ROWSPAN'] = 5;
			$data[2]['COLSPAN'] = 2;
		}
		
		if ($j==17){
			$data[0]['TEXT'] = $ttxt2;
			$data[0]['T_ALIGN'] = 'C';
			$data[0]['V_ALIGN'] = 'M';
			$data[0]['BG_COLOR'] = array(234, 255, 218);
			$data[0]['ROWSPAN'] = 5;
			$data[0]['COLSPAN'] = 4;
		}
			
		$fsize += 0.5;
		
		if ($fsize > 10) $fsize = 5;
		
		$rgb_b -= 10;
		$rgb_g -= 5;
		$rgb_b -= 20;
		
		if ($rgb_b < 150) $rgb_b = 255;
		if ($rgb_g < 150) $rgb_g = 255;
		if ($rgb_b < 150) $rgb_b = 255;	

		$pdf->tbDrawData($data);
	}
	
	//output the table data to the pdf
	$pdf->tbOuputData();
	
	//draw the Table Border
	$pdf->tbDrawBorder();	

	$pdf->Output();

?>