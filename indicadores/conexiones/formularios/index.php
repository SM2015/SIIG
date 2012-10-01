<?php
session_start();
include_once("formulario.php");
include_once("../../addons/general/general.php");
include_once("../../lib/menu.php");
$valido = (isset($_SESSION['uid']))? $_SESSION['uid'] : NULL;
$rol = (isset($_SESSION['rol']))? $_SESSION['rol'] : NULL;
if($valido<> null){
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
<title>Generar Formulario para ingreso de Datos</title>
        <script type="text/javascript" src="ajax2.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" type="text/css" href="../../addons/css/general.css">
        <script type='text/javascript' src='../../addons/js/jquery-latest.js'></script>
        <script type="text/javascript" src="../../addons/js/general.js"></script>
        <script type="text/javascript" src="../../addons/js/gen_validatorv2.js"></script>
        <link rel="stylesheet" type="text/css" href="../../addons/tables/stripy_tables.css">
        <script language="JavaScript" type="text/javascript" src="../../addons/tables/core.js"></script>
        <script language="JavaScript" type="text/javascript" src="../../addons/tables/stripy_tables.js"></script>
        <link rel="stylesheet" type="text/css" href="../../addons/chromemenu/chrometheme/chromestyle.css">
        <script language="JavaScript1.5" type="text/javascript" src="../../addons/chromemenu/chromejs/chrome.js"></script>
        <script type="text/javascript" src="../../addons/yui1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
        <script type="text/javascript" src="../../addons/yui1/build/animation/animation-min.js"></script>
        <script type="text/javascript" src="../../addons/yui1/build/dragdrop/dragdrop-min.js"></script>
<script language="JavaScript" type="text/javascript">
function countChoices(obj,id) {
max = 1; // max. number allowed at a time
var tem1= 'llave'+id;
var tem2= 'llaveg'+id;
var box1=document.getElementById(tem1).checked;
var box2=document.getElementById(tem2).checked;
count = (box1 ? 1 : 0) + (box2 ? 1 : 0) ;
if (count > max) {
alert("Solo puedes elegir " + max + " opcion como maximo.");
obj.checked = false;
   }
}

</script>
	</head>
	<body>
		<table align="center" width="100%">
			<tr>
				<td align="center">
				<img src="../../lib/logo_salud.png" width="800" height="90" />
				</td>
			</tr>
		</table>
		<p align="right" ><a href="/indicadores/usuarios/index.php">Cerrar sesi&oacute;n</a></p>
		<script language="JavaScript1.5" type="text/javascript" src="../../addons/js/MPJSBackLinks.js"></script>
		<table   border="0" cellpadding="2" cellspacing="0" class="dataTable" width="100%">
			<thead>
				<tr>
					<th><?php echo menu($rol); ?></th>
				</tr>
			</thead>
		</table>
		<?php 
			$accion = (isset($_REQUEST['action'])) ? $_REQUEST['action'] : NULL;
			switch ($accion) {
				case 'nuevo':
					$fpaso = (isset($_REQUEST['fpaso'])) ? $_REQUEST['fpaso'] : NULL;
					switch ($fpaso) {
						case '1':
							agregar_formulario1();
						break;
						case '2':
							$id = (isset($_REQUEST['id'])) ? $_REQUEST['id'] : NULL;
							agregar_formulario2($id);
						break;
						case '3':
							$id = (isset($_REQUEST['id'])) ? $_REQUEST['id'] : NULL;
							agregar_formulario3($id);
						break;	

						case '4':
							$id = (isset($_REQUEST['id'])) ? $_REQUEST['id'] : NULL;
							agregar_formulario4($id);
						break;	
					}	
				break;
				case 'guardarnuevo':
					$paso = (isset($_REQUEST['paso'])) ? $_REQUEST['paso'] : NULL;
					switch ($paso) {
						case '1':
							grabar_nuevo_formulario1();
						break;
						case '2':
							$id = (isset($_REQUEST['id'])) ? $_REQUEST['id'] : NULL;
							$cant=(isset($_REQUEST['cant'])) ? $_REQUEST['cant'] : NULL;
							for ($i=0;$i<=$cant-1; $i ++){
								$e=$i+1;
								$p="li1_".$e;
								$p=$_REQUEST[$p];
								$orden[$i]=$p;
							}
							grabar_nuevo_formulario2($id,$orden,$cant);
						break;
						case '3':
							$id = (isset($_REQUEST['id'])) ? $_REQUEST['id'] : NULL;
							grabar_nuevo_formulario3($id);
						break;	
					}	
				break;
				case 'editar':
					$id = (isset($_REQUEST['id']))? $_REQUEST['id'] : NULL;
					editar_formulario($id);
				break;
				case 'guardar':
					$id = (isset($_REQUEST['id']))? $_REQUEST['id'] : NULL;
					$paso = (isset($_REQUEST['paso']))? $_REQUEST['paso'] : NULL;
					switch ($paso) {
						case '1':
							actualizar_formulario($id);
						break;
					}	
				break;
					case 'borrar':
					$id = (isset($_REQUEST['id']))? $_REQUEST['id'] : NULL;
					borrar_formulario($id);
				break;
				default:
		?>
					<h2 align="center"><a href="index.php?action=nuevo&fpaso=1" title="Agregar un Formulario">Agregar una Formulario</a></h2>
		<?php	
					$data = array('Editar','Borrar');
					$urls = array('Editar','Borrar');
					echo listarTodos('form', $data, $urls, 'id_form , nombre,comentario');
				break;
			}
		?>
	</body>
</html>
<?php
}else{
    echo "<script>document.location.href='/indicadores/usuarios/index.php'</script>";
}