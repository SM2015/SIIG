<?php
include_once("../../addons/general/general.php");
    $cnx = bdd_conectar();
$variable= (isset($_REQUEST['variable'])) ? $_REQUEST['variable'] : NULL;
$var1 = explode(',',$variable); 
$con=sizeof($var1);
if ($var1[0]!=''){
    $boton='';
    while (list($i,$valor)=each($var1)){
       $q="SELECT  nombre, iniciales  FROM variable_dato where id_variable=".$valor;
       $rs = bdd_pg_query($cnx, $q);
       $reg = bdd_pg_fetch_row($rs);
       $boton=$boton.','.$reg[1];
       echo "<input  class='frm-btn-x' type='button' name='cancel' title='".$reg[1]."' id='Cancel' value='".$reg[1]."' onclick='nvar(this)'  />";
        echo "<font size=2 color='#006600'> = ".$reg[0]."</font><br /> ";
    }
}else{
    echo '';
}
?>
<input type="hidden" name="boton" id="boton" value="<?php echo $boton; ?>" />