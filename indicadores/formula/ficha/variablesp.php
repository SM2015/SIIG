<?php
	require_once("../../addons/fpdf/table/class.fpdf_table.php");
	require_once("encabezado_pie.inc");
	require_once("table_def.inc");
        include_once("../../addons/general/general.php");
        include_once("../../../phpmathpublisher/mathpublisher.php") ;
        include_once("ficha.php");
      $q="SELECT DISTINCT ON (variable_dato.nombre) 
              variable_dato.nombre,
              variable_dato.iniciales,
              fuente_dato.nombre,
              fuente_dato.contacto,
              fuente_dato.correo,
              fuente_dato.telefono,
              fuente_dato.cargo,
              responsable_dato.nombre,
              responsable_dato.contacto,
              responsable_dato.correo,
              responsable_dato.telefono,
              responsable_dato.cargo,
              variable_dato.confiabilidad
            FROM public.ficha_tecnica_variable, public.variable_dato, public.responsable_dato,
              public.fuente_dato, public.sentencia, public.conexion
            WHERE ficha_tecnica_variable.id_variable = variable_dato.id_variable AND
              responsable_dato.id_responsable_dato = variable_dato.id_responsable AND
              fuente_dato.id_fuente_dato = variable_dato.id_fuente AND
              sentencia.id_sentencia = variable_dato.id_sentencia and
              ficha_tecnica_variable.id_ficha_tecnica=27";
        $cnx = bdd_conectar();
        $rs = bdd_pg_query($cnx, $q);
	$bg_color1 = array(234, 255, 218);
	$bg_color2 = array(165, 250, 220);
	$bg_color3 = array(255, 252, 249);
        $pdf = new pdf_usage();		
	$pdf->Open();
	$pdf->SetAutoPageBreak(true, 20);
        $pdf->SetMargins(15, 20, 20);
	$pdf->AddPage();
	$pdf->AliasNbPages(); 
	$columns = 2; //
	$pdf->SetStyle("p","times","",10,"130,0,30");
	$pdf->SetStyle("t1","arial","",10,"0,151,200");
	$pdf->SetStyle("size","times","BI",13,"0,0,120");
	$pdf->tbInitialize($columns, true, true);
	$pdf->tbSetTableType($table_default_table_type);
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
	$aHeaderArray = array(
		$header_type1
	);	
	$pdf->tbSetHeaderType($aHeaderArray, true);
        $data_type = Array();
        while ($reg = bdd_pg_fetch_row($rs)) {
	$pdf->tbDrawHeader();      
            for ($i=0; $i<$columns; $i++) $data_type[$i] = $table_default_data_type;
            $pdf->tbSetDataType($data_type);
            $fsize = 5;
            $colspan = 2;
            $rowspan = 2;
            $rgb_r = 255;
            $rgb_g = 255;
            $rgb_b = 255;
            $fijo=array(
                'Nombre de la Variable',
                'Iniciales de la Variable',
                'Nombre de la Fuente de Datos',
                'Contacto en la Fuente de Datos',
                'Correo electronico',
                'Telefonono',
                'Cargo',
                'Nombre del Responsable del Datos',
                'Contacto Responsable del Datos',
                'Correo electronico',
                'Telefonono',
                'Cargo',
                'Fiabilidad del la Variable (%)'
             );
            $i=0;
            $data = Array();
            $data[0]['BG_COLOR'] = array(255-$rgb_b, $rgb_g, $rgb_r);
            $data[0]['T_ALIGN'] = "L";
            $data[1]['T_ALIGN'] = "L";
            for ($j=0; $j<13; $j++){
                    $data[0]['TEXT'] = " $fijo[$j]";
                    $data[1]['TEXT'] = "$reg[$i]";
                    $pdf->tbDrawData($data);
                    $i++;
            }
        }
	$pdf->tbOuputData();
	$pdf->tbDrawBorder();	
          $pdf->Output();
?>
