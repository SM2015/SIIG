<?php
session_start();
include_once("form_usuarios.php");
include_once("../../addons/general/general.php");
include_once("../../lib/menu.php");
$valido = (isset($_SESSION['uid']))? $_SESSION['uid'] : NULL;
$rol = (isset($_SESSION['rol']))? $_SESSION['rol'] : NULL;
if($valido<> null){ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><?php
    $_SESSION['id']=(isset($_REQUEST['id'])) ? $_REQUEST['id'] : NULL;
    $titulo=titulo($_SESSION['id']);?>
    <title><?php echo $titulo; ?></title>
        <script type="text/javascript" src="ajax1.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" type="text/css" href="../../addons/css/general.css">
        <script type="text/javascript" src="../../addons/js/general.js"></script>
        <script type="text/javascript" src="../../addons/js/gen_validatorv2.js"></script>
        <link rel="stylesheet" type="text/css" href="../../addons/tables/stripy_tables.css">
        <script language="JavaScript" type="text/javascript" src="../../addons/tables/core.js"></script>
        <script language="JavaScript" type="text/javascript" src="../../addons/tables/stripy_tables.js"></script>
        <link rel="stylesheet" type="text/css" href="../../addons/chromemenu/chrometheme/chromestyle.css">
        <script language="JavaScript1.5" type="text/javascript" src="../../addons/chromemenu/chromejs/chrome.js"></script>
        <link rel="stylesheet" type="text/css" href="../../addons/calendar/calendar-blue.css">
        <script type="text/javascript" src="../../addons/calendar/calendar.js"></script>
        <script type="text/javascript" src="../../addons/calendar/lang/calendar-es.js"></script>
        <script type="text/javascript" src="../../addons/calendar/calendar-setup.js"></script>
        <script type="text/javascript">
            function validate(evt) {
                    var theEvent = evt || window.event;
                    var key = theEvent.keyCode || theEvent.which;
                    key = String.fromCharCode( key );
                    var regex = /[0-9]|\./;
                    if( !regex.test(key) ) {
                            theEvent.returnValue = false;
                            theEvent.preventDefault();
                    }
            }
        </script>
        <style type="text/css">
          .blink
          {text-decoration: blink;
          color: red;}
        </style>
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
		<table  border="0" cellpadding="2" cellspacing="0" class="dataTable" width="100%">
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
					$id = (isset($_REQUEST['id']))? $_REQUEST['id'] : NULL;
					agregar_formulario_usuario($id);
				break;
				case 'guardarnuevo':
					$id = (isset($_REQUEST['id']))? $_REQUEST['id'] : NULL;
					grabar_nuevo_formulario_usuario($id);
				break;
				case 'editar':
					$id = (isset($_REQUEST['id']))? $_REQUEST['id'] : NULL;
					$idf = (isset($_REQUEST['idf']))? $_REQUEST['idf'] : NULL;
					editar_formulario($id, $idf);
				break;
				case 'guardar':
					$id = (isset($_REQUEST['id']))? $_REQUEST['id'] : NULL;
					$idf = (isset($_REQUEST['idf']))? $_REQUEST['idf'] : NULL;
					actualizar_formulario($id, $idf);
				break;
					case 'borrar':
					$id = (isset($_REQUEST['id']))? $_REQUEST['id'] : NULL;
                                        $idf = (isset($_REQUEST['idf']))? $_REQUEST['idf'] : NULL;
					borrar_form_usuarios($id,$idf);
				break;
				default:?>
					<h2 align="center"><a href="index.php?action=nuevo&id=<?php echo $_SESSION['id']; ?>"
                                        title="Agregar en <?php echo $titulo; ?>">Agregar en <?php echo $titulo; ?></a></h2> <?php
					$data = array('Editar','Borrar');
					$urls = array('Editar','Borrar');
					echo listarTodos('form_'.$_SESSION['id'], $data, $urls, '*',$_SESSION['id']);
				break;
			}?>
	</body>
</html>
<?php
}else{
    echo "<script>document.location.href='/indicadores/usuarios/index.php'</script>";
}