<?php
	require_once("../../addons/fpdf/table/class.fpdf_table.php");
	require_once("encabezado_pie.inc");
	require_once("table_def.inc");
	include_once("../../addons/general/general.php");
        include_once("../../addons/phpmathpublisher/mathpublisher.php") ;
        include_once("ficha.php");
        $id = (isset($_REQUEST['id']))? $_REQUEST['id'] : NULL;
        $q="SELECT f.nombre, f.tema, f.concepto, f.objetivo, f.uso, f.definicion_operativa, f.unidad_medida, n.descripcion,
                    t.descripcion,  p.descripcion,  u.descripcion, r.nombre, f.observacion, f.confiabilidad, f.formula
            FROM ficha_tecnica as f, clasificacion_nivel as n, clasificacion_privacidad as p, clasificacion_tecnica as t,
                    clasificacion_uso as u, responsable_indicador as r
            WHERE f.id_responsable_indicador = r.id_responsable_indicador AND f.id_clasificacion_uso = u.id_clasificacion_uso AND
                    n.id_clasificacion_nivel = f.id_clasificacion_nivel AND p.id_clasificacion_privacidad = f.id_clasificacion_privacidad AND
                    t.id_clasificacion_tecnica = f.id_clasificacion_tecnica and id_ficha_tecnica=".$id;
        $cnx = bdd_conectar();
        $rs = bdd_pg_query($cnx, $q);
	$reg = bdd_pg_fetch_row($rs);
        $formula=$reg[14];
	$bg_color1 = array(234, 255, 218);
	$bg_color2 = array(165, 250, 220);
	$bg_color3 = array(255, 252, 249);	
	$pdf = new pdf_usage();		
	$pdf->Open();
	$pdf->SetAutoPageBreak(true, 20);
        $pdf->SetMargins(15, 20, 20);
	$pdf->AddPage();
	$pdf->AliasNbPages(); 
	$columns = 2; 
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
	$header_type1[0]['TEXT'] = "Nombre del Indicador";
	$header_type1[1]['TEXT'] = "$reg[0]";
	$aHeaderArray = array(
		$header_type1
	);	
	$pdf->tbSetHeaderType($aHeaderArray, true);
	$pdf->tbDrawHeader();
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
            'Formula'
        );
        $i=1;
        $data = Array();
        $data[0]['BG_COLOR'] = array(236, 230, 230);
        $data[0]['T_ALIGN'] = "L";
        $data[1]['T_ALIGN'] = "L";      
        for ($j=0; $j<14; $j++){
            if ($j==13){
                $data[0]['TEXT'] = "$fijo[$j]";
                $size=15;
             //   $nameimg ="math_980_".md5(trim($formula).$size).".png";
             //   $data[1]['TEXT'] = $pdf->Image("../../addons/phpmathpublisher/img/".$nameimg,100,265,30); 
            }else{
                $data[0]['TEXT'] = "$fijo[$j]";
                $data[1]['TEXT'] = "$reg[$i]";
             }    
                
                $pdf->tbDrawData($data);
                $i++;

	}
	$pdf->tbDrawBorder();	
////******
              $q="SELECT DISTINCT ON (d.nombre) d.nombre, d.iniciales, f.nombre, f.contacto, f.correo, f.telefono, f.cargo,
                         r.nombre, r.contacto, r.correo, r.telefono, r.cargo, d.confiabilidad, d.comentario
                  FROM ficha_tecnica_variable as v, variable_dato as d, responsable_dato as r, fuente_dato as f, sentencia as s, conexion as c
                  WHERE v.id_variable = d.id_variable AND r.id_responsable_dato = d.id_responsable AND f.id_fuente_dato = d.id_fuente AND
                          s.id_sentencia = d.id_sentencia and v.id_ficha_tecnica=".$id;
        $rs = bdd_pg_query($cnx, $q);
        $data_type = Array();
        while ($reg = bdd_pg_fetch_row($rs)) {
            for ($i=0; $i<$columns; $i++) $data_type[$i] = $table_default_data_type;
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
                'Fiabilidad del la Variable (%)',
                'Comentario'
             );
            $i=0;
            $data = Array();
            $data[0]['BG_COLOR'] = array(230, 230, 255);
            $data[0]['T_ALIGN'] = "L";
            $data[1]['T_ALIGN'] = "L";
            for ($j=0; $j<14; $j++){
                if ($j==0){
			$data[0]['BG_COLOR'] = array(106, 206, 236);
                        $data[1]['BG_COLOR'] = array(106, 206, 236);
                }else{
                        $data[0]['BG_COLOR'] = array(236, 230, 230);
                        $data[1]['BG_COLOR'] = array(255,255,255);
                }
                    $data[0]['TEXT'] = " $fijo[$j]";
                    $data[1]['TEXT'] = "$reg[$i]";
                    $pdf->tbDrawData($data);
                    $i++;
            }
        }
        $size=15;
      //  $nameimg ='math_980_'. md5(trim($formula).$size).'.png';
       // $pdf->Image("../../addons/phpmathpublisher/img/".$nameimg,100,265,30);
	$pdf->tbOuputData();
      	$pdf->tbDrawBorder();
        $pdf->Output("ficha.pdf","F");
?>