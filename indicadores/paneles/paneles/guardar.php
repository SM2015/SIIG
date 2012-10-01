<?php
include_once("../../addons/general/general.php");
$cnx = bdd_conectar();
$datos = (isset($_REQUEST['datos'])) ? $_REQUEST['datos'] : '%';
$usr = (isset($_REQUEST['usr'])) ? $_REQUEST['usr'] : '%';
$array = explode(",",$datos);
$cant_var=sizeof($array);
for($i=0;$i<$cant_var;$i++){
$q="UPDATE series SET temporal=2 WHERE id_usuario=". $usr ." and id_indicador=".$array[$i];
$rs = bdd_pg_query($cnx, $q);
$af = bdd_pg_affected_rows($rs);
}
bdd_cerrar($cnx);
?>
