<?php
		
	//load the table default definitions
	require("example2_def.inc");
	
	$columns = 3; //number of Columns
	
	//Initialize the table class
	$pdf->tbInitialize($columns, true, true);
	
	$aSimpleHeader = array();
	
	//Table Header
	for($i=0; $i<$columns; $i++) {
		$aSimpleHeader[$i] = $table_default_header_type;
		$aSimpleHeader[$i]['TEXT'] = "Column " . ($i + 1) . " text";
		$aSimpleHeader[$i]['WIDTH'] = 30;
	}
	
	$aSimpleHeader1 = $aSimpleHeader;
	$aSimpleHeader2 = $aSimpleHeader;
	
	$aSimpleHeader1[1]['TEXT'] = "Rowspan/Colspan can be made also in the header.";
	$aSimpleHeader1[1]['ROWSPAN'] = 2;
	$aSimpleHeader1[1]['COLSPAN'] = 2;
	$aSimpleHeader1[1]['BG_COLOR'] = $bg_color4;
	$aSimpleHeader1[1]['T_COLOR'] = array(0,0,0);
	
	$aHeader = array(
		$aSimpleHeader,
		$aSimpleHeader1, 
		$aSimpleHeader2
	);

	//set the Table Header
	$pdf->tbSetHeaderType($aHeader, true);
	
	//set the Table Type
	$pdf->tbSetTableType($table_default_table_type);	
	
	if (isset($bTableSplitMode))
		$pdf->tbSetSplitMode($bTableSplitMode);
	
	//Draw the Header
	$pdf->tbDrawHeader();

	//Table Data Settings
	$aDataType = Array();
	for ($i=0; $i<$columns; $i++) $aDataType[$i] = $table_default_data_type;

	$pdf->tbSetDataType($aDataType);

	for ($j=1; $j<=15; $j++)
	{
		$data = Array();
		$data[0]['TEXT'] = "Line $j Text 1";
		$data[1]['TEXT'] = "Line $j Text 2";
		$data[2]['TEXT'] = "Line $j Text 3";
		
		if ($j == 1){
			$data[0]['BG_COLOR'] = $bg_color5;
			$data[0]['TEXT'] = 'Colspan Example';
			$data[0]['COLSPAN'] = 2;
		}
		
		if ($j == 2){
			$data[1]['BG_COLOR'] = $bg_color6;
			$data[1]['TEXT'] = 'Rowspan Example';
			$data[1]['ROWSPAN'] = 2;
		}
		
		if ($j == 4){
			$data[1]['BG_COLOR'] = $bg_color7;
			$data[1]['TEXT'] = 'Rowspan && Colspan Example';
			$data[1]['ROWSPAN'] = 2;
			$data[1]['COLSPAN'] = 2;
		}
		
		if (($j >= 7) && ($j <= 9)){
			$data[0]['TEXT'] = "More lines...\nLine2\nLine3";
		}
		
		if ($j == 7){
			$data[1]['TEXT'] = "Top Left Align";
			$data[1]['V_ALIGN'] = "T";
			$data[1]['T_ALIGN'] = "L";
			
			$data[2]['TEXT'] = "Bottom Right Align";
			$data[2]['V_ALIGN'] = "B";
			$data[2]['T_ALIGN'] = "R";
		}
		
		if ($j == 8){
			$data[1]['TEXT'] = "Top Center Align";
			$data[1]['V_ALIGN'] = "T";
			$data[1]['T_ALIGN'] = "C";
			
			$data[2]['TEXT'] = "Bottom Center Align";
			$data[2]['V_ALIGN'] = "B";
			$data[2]['T_ALIGN'] = "C";
		}
		
		if ($j == 9){
			
			$pdf->SetStyle("sd1", "times", "", 6, "0,49,159");
			$pdf->SetStyle("sd2", "arial", "", 5, "140,12,12");
			$pdf->SetStyle("sd3", "arial", "", 6, "0,5,90");
			
			$data[1]['TEXT'] = "<sd1>This is just a longer text, justified align, middle vertical align to demonstrate some other capabilities. Test text. Test text.</sd1>
<sd3>\tSettings:</sd3>
<p size='15' > ~~~</p><sd2>- Rowspan=4</sd2>
<p size='15' > ~~~</p><sd2>- Colspan=2</sd2>
";

			$data[1]['V_ALIGN'] = "M";
			$data[1]['T_ALIGN'] = "J";
			$data[1]['COLSPAN'] = 2;
			$data[1]['ROWSPAN'] = 4;
			$data[1]['LN_SIZE'] = 2.3;
		}
		
		if ($j==14){
			
			$data[1]['TEXT'] = "Cell Properties Overwriting Example";
			$data[1]['T_FONT'] = "Times";
			$data[1]['T_SIZE'] = 7;
			$data[1]['T_TYPE'] = "B";
			$data[1]['BG_COLOR'] = array(240,240,209);
			$data[1]['BRD_COLOR'] = array(100, 100, 200);
		
			$data[1]['V_ALIGN'] = "T";
			$data[1]['T_ALIGN'] = "C";			
		}
		
		$pdf->tbDrawData($data);
	}
	
	//output the table data to the pdf
	$pdf->tbOuputData();
	
	//draw the Table Border
	$pdf->tbDrawBorder();
	

?>