<?php
include_once("../../addons/general/general.php");
$cnx = bdd_conectar();
$datos = (isset($_REQUEST['dato'])) ? $_REQUEST['dato'] : '%';
$usr = (isset($_REQUEST['usr'])) ? $_REQUEST['usr'] : '%';
$array = explode("_",$datos);
$q="UPDATE series SET temporal=1 WHERE id_usuario=". $usr ." and tem=".substr($array[1],0,3);
$rs = bdd_pg_query($cnx, $q);
$af = bdd_pg_affected_rows($rs);
bdd_cerrar($cnx);
?>
