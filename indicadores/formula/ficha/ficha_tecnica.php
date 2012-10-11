<?php
	require_once("../../addons/fpdf/table/class.fpdf_table.php");
	require_once("encabezado_pie.inc");
	require_once("table_def.inc");
	include_once("../../addons/general/general.php");
        include_once("../../addons/phpmathpublisher/mathpublisher.php") ;
        include_once("ficha.php");
        $q="SELECT
          ficha_tecnica.nombre,
          ficha_tecnica.tema,
          ficha_tecnica.concepto,
          ficha_tecnica.objetivo,
          ficha_tecnica.uso,
          ficha_tecnica.definicion_operativa,
          ficha_tecnica.unidad_medida,
          clasificacion_nivel.descripcion,
          clasificacion_tecnica.descripcion,
          clasificacion_privacidad.descripcion,
          clasificacion_uso.descripcion,
          responsable_indicador.nombre,
          ficha_tecnica.observacion,
          ficha_tecnica.confiabilidad
        FROM
          public.ficha_tecnica,
          public.clasificacion_nivel,
          public.clasificacion_privacidad,
          public.clasificacion_tecnica,
          public.clasificacion_uso,
          public.responsable_indicador
        WHERE
          ficha_tecnica.id_responsable_indicador = responsable_indicador.id_responsable_indicador AND
          ficha_tecnica.id_clasificacion_uso = clasificacion_uso.id_clasificacion_uso AND
          clasificacion_nivel.id_clasificacion_nivel = ficha_tecnica.id_clasificacion_nivel AND
          clasificacion_privacidad.id_clasificacion_privacidad = ficha_tecnica.id_clasificacion_privacidad AND
          clasificacion_tecnica.id_clasificacion_tecnica = ficha_tecnica.id_clasificacion_tecnica and id_ficha_tecnica=29";
        $cnx = bdd_conectar();
        $rs = bdd_pg_query($cnx, $q);
	$reg = bdd_pg_fetch_row($rs);
	$bg_color1 = array(234, 255, 218);
	$bg_color2 = array(165, 250, 220);
	$bg_color3 = array(255, 252, 249);	
	
	$pdf = new pdf_usage();		
	$pdf->Open();
	$pdf->SetAutoPageBreak(true, 20);
        $pdf->SetMargins(15, 20, 20);
	$pdf->AddPage();
	$pdf->AliasNbPages(); 

	$columns = 2; //five columns

	$pdf->SetStyle("p","times","",10,"130,0,30");
	$pdf->SetStyle("t1","arial","",10,"0,151,200");
	$pdf->SetStyle("size","times","BI",13,"0,0,120");
    
	
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
		$header_type2[$i]['BG_COLOR'] = $bg_color1;
	}

	$header_type1[0]['WIDTH'] = 40;
	$header_type1[1]['WIDTH'] = 130;
        $header_type1[0]['T_ALIGN'] = "L";
        $header_type1[1]['T_ALIGN'] = "L";

	
	$header_type1[0]['TEXT'] = "Nombre del Indicador";
	$header_type1[1]['TEXT'] = "$reg[0]";
	
	
	$aHeaderArray = array(
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
        $fijo=array(
            'Tema',
            'Concepto',
            'Objetivo',
            'Uso',
            'Definicion',
            'Unidad de Medida',
            'Clasificacion por su nivel de uso',
            'Clasificacion Tecnica',
            'Clasificacion por su provacidad',
            'Otra Clasificacion',
            'Responsable',
            'Obseervacion',
            'Fiabilidad',
        );
        $i=1;
	for ($j=0; $j<12; $j++)
	{
		$data = Array();
                $data[0]['BG_COLOR'] = array(255-$rgb_b, $rgb_g, $rgb_r);
                $data[0]['T_ALIGN'] = "L";
		$data[0]['TEXT'] = " $fijo[$j]";


                $data[1]['T_ALIGN'] = "L";
                $data[1]['TEXT'] = "$reg[$i]";

                $fsize += 0.5;
		
		//if ($fsize > 10) $fsize = 5;

		$pdf->tbDrawData($data);
                $i++;
	}

	
	//output the table data to the pdf
	$pdf->tbOuputData();
	
	//draw the Table Border
	$pdf->tbDrawBorder();	
        $pdf->Output();
 
?>