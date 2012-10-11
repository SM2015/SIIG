
<?php
session_start();
include_once("../../lib/menu.php");
include_once("../../addons/general/general.php");
include_once("indicadores.php");
$valido = (isset($_SESSION['uid']))? $_SESSION['uid'] : NULL;
$rol = (isset($_SESSION['rol']))? $_SESSION['rol'] : NULL;
if($valido<> null){
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
    <title>Configurar Indicadores</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="../../addons/yui1/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../../addons/yui1/build/container/assets/skins/sam/container.css" />
<script type="text/javascript" src="../../addons/yui1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../../addons/yui1/build/connection/connection-min.js"></script>
<script type="text/javascript" src="../../addons/yui1/build/element/element-min.js"></script>
<script type="text/javascript" src="../../addons/yui1/build/button/button-min.js"></script>
<script type="text/javascript" src="../../addons/yui1/build/dragdrop/dragdrop-min.js"></script>
<script type="text/javascript" src="../../addons/yui1/build/container/container-min.js"></script>
<script type="text/javascript" src="ajax1.js"></script>
<link rel="stylesheet" type="text/css" href="../../addons/css/general.css">
<script type="text/javascript" src="../../addons/js/general.js"></script>
<script type="text/javascript" src="../../addons/js/gen_validatorv2.js"></script>
<link rel="stylesheet" type="text/css" href="../../addons/tables/stripy_tables.css">
<script language="JavaScript" type="text/javascript" src="../../addons/tables/core.js"></script>
<script language="JavaScript" type="text/javascript" src="../../addons/tables/stripy_tables.js"></script>
<link rel="stylesheet" type="text/css" href="../../addons/chromemenu/chrometheme/chromestyle.css">
<script language="JavaScript1.5" type="text/javascript" src="../../addons/chromemenu/chromejs/chrome.js"></script>
<link rel="stylesheet" type="text/css" href="../../addons/yui1/build/fonts/fonts-min.css" />
</head>
<?php
$datos = (isset($_REQUEST['datos'])) ? $_REQUEST['datos'] : '%';
$cnx = bdd_conectar();
$array = explode(",",$datos);
$cant_var=sizeof($array);
conf($array);
}else{
    echo "<script>document.location.href='/indicadores/usuarios/index.php'</script>";
}

?>