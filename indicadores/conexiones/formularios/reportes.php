<?php
//ob_end_clean();
require('../../addons/fpdf/fpdf.php');
include_once('../../addons/fpdf/fpdf.php');
include_once('../../addons/general/general.php');
define('FPDF_FONTPATH','../../addons/fpdf/font/');
$_SESSION['id'] =(isset($_REQUEST["id"]))? $_REQUEST["id"] :"";
class PDF extends FPDF{
	function Header(){	
		$id= $_SESSION['id'];

                $titulo=titulo($_SESSION['id']);
		//Logo de la pagina en el lado superior derecho
	//	$this->Image('../../lib/reporte.gif',10,2,175);
		// establecemos el tipo y tamño de letra Arial bold 10
		$this->SetFont('courier','B',9);
		//Definimos los titulos del reporte que apareceran en forma centrada

                $this->Cell(0,3,'MINISTERIO DE SALUD',0,1,'C');
		$this->Cell(0,3,'SISTEMA DE INDICADORES',0,2,'C');
                $this->Cell(0,3,'Formulario '.$titulo,0,2,'C');
		$this->Cell(0,3,'Reporte de Tabla form_'.$id,0,2,'C');
	    	$this->SetY(13);
		$this->SetX(10);
                
		//Formamos una fecha para incluir en la cabecera
		$this->SetFont('courier','',8);
		$fechahoy="Fecha: ".date("d-m-Y");
		$hora = "Hora:   ".date("g:h:A"); 
		//imprimimos la variable $fecha en el lado superior izquierdo
		$this->Cell(9,5,$fechahoy,0,0,'L');
		$this->SetY(13);
		$this->SetX(9);
		$this->Cell(9,11,$hora,0,0,'L');
		// dibujamo una  linea horizontal despues de los titulos
		$this->SetLineWidth(0);
		$this->Line(10,23,200,23);
		// definimos color gris de relleno para los titulos de la tabla
		$this->SetFillColor(232,232,232);
		$this->SetY(25);
		$this->SetX(10);
		$col1=5;
		$col2=35;
		$col3=25;
		$col4=28;
		$col5=22;
		$col6=18;
		$col7=18;
                $col8=40;
		// imprimimos los titulos de la tabla para los nombres de los campos
		$this->Cell($col1,6,'N.',0,0,'C',1);
		$this->Cell($col2,6,'Nombre del Campo',0,0,'C',1);
		$this->Cell($col3,6,'Tipo de Campo',0,0,'C',1);
  		$this->Cell($col4,6,'Auto Incremental',0,0,'C',1);
  		$this->Cell($col5,6,'Es Nulo',0,0,'C',1);
                $this->Cell($col6,6,'Tamaño',0,0,'C',1);
	  	$this->Cell($col7,6,'Presicion',0,0,'C',1);
                $this->Cell($col8,6,'Descripcion',0,0,'C',1);
		//Line break
		$this->Ln(2);
	}
	//Page footer
	function Footer(){
		//definimos la posicion a 1.5 cm del margen inferior de las paginas para numerarlas
		$this->SetY(-15);
		//Formateamos el tipo y tamaño de letra para los numeros de pagina
		$this->SetFont('courier','',8);
		//Numeramos las paginas
		$this->Cell(0,10,'Pagina '.$this->PageNo().' de {nb}',0,0,'C');
	}
}

//Instanciation of inherited class
//P= VERTICAL L= HORIZONTAL
$id= $_SESSION['id'];
$pdf=new PDF('P');
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetFont('courier','',10);
$row_height = 12;
// generar reporte 
//set initial y axis position per page
$y_axis = 23;
$y_axis = $y_axis + $row_height;

$cnx = bdd_conectar();
//datos requeridos para imprimir 
//
$q = "SELECT COLUMNS.column_name, COLUMNS.data_type, COLUMNS.column_default, COLUMNS.is_nullable, COLUMNS.character_maximum_length, COLUMNS.numeric_precision, pg_description.description, COLUMNS.TABLE_NAME
FROM information_schema.COLUMNS  LEFT JOIN pg_class ON COLUMNS.TABLE_NAME::name = pg_class.relname LEFT JOIN pg_description ON pg_class.oid = pg_description.objoid AND COLUMNS.ordinal_position::INTEGER = pg_description.objsubid
WHERE COLUMNS.table_schema::text = 'public'::text  AND COLUMNS.TABLE_NAME = 'form_".$id."'
ORDER BY COLUMNS.TABLE_NAME ASC, COLUMNS.ordinal_position ASC ";
//echo mysqli_error($cnx);
	
//echo mysqli_error($cnx);
//print $q;
$result = pg_query($cnx, $q);
$rown = pg_num_rows($result);
if ($rown!=0) { 
//numero maximo de filas por página
$max = 55;

// definirmos la altura para cada linea
$row_height =18;

//inicializamos el contador de filas
$i = 0;
$m=1;
$parmmicro=0;
$preservante=0;
$colorante=0;
$etiquetado=0;
$otro=0;
while($row = pg_fetch_row($result)){
	//If the current row is the last one, create new page and print column title
	if ($i == $max){
		$pdf->AddPage();
		$y_axis=25;
		//Go to next row
		$y_axis = $y_axis + $row_height;
		//Set $i variable to 0 (first row)
		$i = 0;
	}

	// definimos color blanco de relleno e imprimos campos de la tabla
  	$pdf->SetFillColor(255,255,255); 
		$col1=5;
		$col2=35;
		$col3=25;
		$col4=25;
		$col5=25;
		$col6=25;
		$col7=20;
		$col8=25;
	if (strlen($row[1])<=100){
		$pdf->SetY($y_axis);
		$pdf->SetX(8);
		$pdf->SetFont('courier','',8);
        	$pdf->MultiCell($col1,3,$m,0,0,'L',1);
		$pdf->SetY($y_axis);
		$pdf->SetX(19);
		$pdf->MultiCell($col2,3,$row[0],0,'L');	 
		
		$pdf->SetY($y_axis);
		$pdf->SetX(51);
		$pdf->MultiCell($col3,3,$row[1],0,'L','J');
		if ($row[2]!=''){
                    $auto='SI';
                }else{
                    $auto='NO';
                }
		$pdf->SetY($y_axis);
		$pdf->SetX(83);
		$pdf->MultiCell($col4,3,$auto,0,'L','J');

                $pdf->SetY($y_axis);
		$pdf->SetX(110);
		$pdf->MultiCell($col5,3,$row[3],0,'L','J');

                $pdf->SetY($y_axis);
		$pdf->SetX(132);
		$pdf->MultiCell($col6,3,$row[4],0,'L','J');

                $pdf->SetY($y_axis);
		$pdf->SetX(150);
		$pdf->MultiCell($col7,3,$row[5],0,'L','J');

                $pdf->SetY($y_axis);
		$pdf->SetX(170);
		$pdf->MultiCell($col8,3,$row[6],0,'L','J');



		$pdf->SetY($y_axis);
		$pdf->SetX(115);
		$pdf->SetY($y_axis);
		$pdf->SetX(135);

	}
		$pdf->SetLineWidth(0);
	//Go to next row
	$y_axis = $y_axis + $row_height;
	$i = $i + 1;
	$m=$m+1;
}
// imprimimos el numero total de registros de la base de datos
$y_axis=257;
$pdf->SetX(10);

//$this->Image('tem.png',175,260,22); 

// cerramos la conexion y generamos el pdf

$pdf->Output("ArchivoPDF.pdf","F");


}else{
print "No hay datos";
}




function titulo($id){
	$cnx1=bdd_conectar();
	$q1="SELECT id_form, nombre, menu_publicacion, comentario, nombre_tabla  FROM form where id_form=".$_SESSION['id'];
	$rs1 = bdd_pg_query($cnx1, $q1);
	$reg1 = bdd_pg_fetch_row($rs1);
	bdd_cerrar($cnx1);
	return $reg1[1];
}
?> 
