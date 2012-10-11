<?php
include_once("roles_opciones.php");
include_once("../../addons/general/general.php");
include_once("../../lib/menu.php");
$cnx = bdd_conectar();
$rol= 	(isset($_REQUEST['rol'])) ? $_REQUEST['rol'] : NULL;
$mopcion= 	(isset($_REQUEST['mopcion'])) ? $_REQUEST['mopcion'] : NULL;
   $q = 'SELECT nombre FROM opciones_menu where id_menu='.$mopcion;
   $rs = bdd_pg_query($cnx, $q); 
   $reg = bdd_pg_fetch_row($rs);
   print "<font color='#B45F04'><h4><p> Opcion Principal --> ".$reg[0]."</p></h3></font>";
?>
<p><font color="#333300">Sub Opciones</font> </p>
<table>
    <TR class="frm-fld-x">
            <TD> <?php echo $reg[0]; ?>
            </TD>
            <TD><p><font color="#B45F04">Disponibles</font> </p>
                    <select name="variable1" size="7" id="variable1" >
                            <?php general_fillCmbxxx('SELECT nombre, id_menu FROM opciones_menu where id_padre='.$mopcion.' and 
                                                        id_menu not in ( SELECT ro.id_opcion FROM roles_opciones as ro, opciones_menu as o
                                                        WHERE  o.id_menu =ro.id_opcion and o.id_padre='.$mopcion.' and ro.id_rol= '.$rol.')', $cnx); ?>
                    </select>
            </TD>
            <TD>	<p><font color='#990000'>Acciones: </font> </p> <input type="button" title="Pasar de la lista Disponible a Seleccionado" value=">" onclick="cambiar(1);">
                    <input type="button" value="<" title= "Pasar de la lista Seleccionado a Disponible" onclick="cambiar(0);"> 
            </TD>
            <TD>   <p><font color="#B45F04">  Seleccionados</font></p>
                    <select name="variable[]" size="7" id="variable" multiple="true" >
                            <?php general_fillCmbxx(' roles as r, roles_opciones as ro, opciones_menu as o ', ' o.nombre ', 'o.id_menu ',
                                                    ' ro.id_rol = r.id_rol AND  ro.id_opcion = o.id_menu and o.id_padre='.$mopcion.' and ro.id_rol='.$rol ,$cnx); ?>
                    </select>
            </TD>
        </TR>
</table>
<input tabindex="3" class="frm-btn-x" type="button" name="add" title="Agregar Nuevo" id="add" value="Adicionar" onclick="seleccionar();"/>
<input tabindex="4" class="frm-btn-x" type="button" name="cancel" title="Cancelar" id="Cancel" value="Cancelar" onclick="javascript:window.location=('index.php');" />
<?php

function general_fillCmbxx($table, $field, $id, $wr, $cnx){
	$qry ="SELECT ".$field.", ".$id." FROM ".$table." where  ".$wr." ORDER BY ".$field;
        $result = bdd_pg_query($cnx,$qry);
	while ($row = bdd_pg_fetch_row($result)) {
		echo ('<option value="'.$row[1].'" selected>'.$row[0].'</option>');
	}
}

function general_fillCmbxxx($q, $cnx){
	$result = bdd_pg_query($cnx,$q);
	while ($row = bdd_pg_fetch_row($result)) {
		echo ('<option value="'.$row[1].'" >'.$row[0].'</option>');
	}
}

