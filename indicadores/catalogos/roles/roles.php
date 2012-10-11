<?php
function agregar_rol(){
$cnx=bdd_conectar(); ?>
<form action="<?php echo $_SERVER['PHP_SELF']?>?action=guardarnuevo" method="POST" id="add" name="add">
<h3 class="frm-title-x">Agregar un Rol de Usuario</h3>
	<fieldset ><legend> Ingreso de un Rol de Usuario</legend>
	<table width="100%" align="center">
		<TR class="frm-fld-x-odd">
			<TD width="20%">Nombre del Rol</TD>
			<TD width="80%">
				<input type='text' tabindex="1" name="rol" id="rol" maxlength="30" size="30" />
			</TD>
		</TR>
                <TR class="frm-fld-x">
			<TD width="20%">Descripcion del Rol</TD>
			<TD width="80%">
				<textarea tabindex="2" name="descripcion" id="descripcion" rows="7" cols="80"></textarea>
			</TD>			
		</TR>
        </table>
	<table width="100%">	
		<tr class="frm-fld-x-odd" colspan="1">
			<TD width="100%"  align="center">
				<input type="hidden" name="action" value="guardarnuevo" />
				<label for="Add">&nbsp;</label>
				<input tabindex="6" class="frm-btn-x" type="submit" name="add" title="Agregar Nuevo" id="Add" value="Adicionar" />
				<input tabindex="7" class="frm-btn-x" type="button" name="cancel" title="Cancelar" id="Cancel" value="Cancelar" onclick="javascript:window.location=('index.php');" />
				
			</TD>
		</tr>
</table>
</fieldset>
</form>
<script language="JavaScript" type="text/javascript"> 
var frmvalidator = new Validator("add");
frmvalidator.addValidation("rol","req","Nombre del Rol es requerido");
frmvalidator.addValidation("descripcion","req","Es requerida una descripcion del Rol");
</script>
 <?php
bdd_cerrar($cnx);
}

function grabar_nuevo_rol(){
$cnx = bdd_conectar();
$rol =(isset($_POST['rol'])) ? $_POST['rol'] : "";
$descripcion =(isset($_POST['descripcion'])) ? $_POST['descripcion'] : "";
$q = "INSERT INTO roles( rol, descripcion)
    VALUES (
  '".$rol."' ,
  '".$descripcion."')";
	$rs = bdd_pg_query($cnx, $q);
	$af = bdd_pg_affected_rows($rs);
	if ($af){ 
		?>
		<p class="ok">Registro modificado!</p>
		<p > Regresar a <a href="/indicadores/catalogos/roles/">Roles</a></p>
		<?php
	} else { 
		?>
		<p class="error">El registro no ha sufrido modificacion<br />
		<p > Regresar a <a href="/indicadores/catalogos/roles/">Roles</a></p>
		<?php echo pg_error($cnx);
	}
	bdd_cerrar($cnx);
}

function listarTodos($table, $data, $url , $fields = '*', $per_page = 10) {
	$cnx = bdd_conectar();
	$actions = "Acciones";
	$aAdd = "Activar";
	$aEdit = "Bloquear";
	$aDelete = "Asignar";
	$q = 'SELECT '.$fields.' FROM '.$table.' order by id_rol';
	$rs = bdd_pg_query($cnx, $q);
	if ($rs) { 
		?><div id="paginador">
  		<?php 
		$url = $_SERVER['PHP_SELF'];	
		$start = 0;
		$start = (isset($_REQUEST['start'])) ? $_REQUEST['start'] : 0;
		if ($start!=0){
			$q1=$q." LIMIT ".$per_page." offset ".$start;
		}else{
		$q1=$q." LIMIT 10";
		}
		$result = bdd_pg_query($cnx, $q1);  
		$rs2 = bdd_pg_query($cnx, $q);
		$total_items = bdd_pg_num_rows($rs2);
		$range = 20;
		$pagination = paginacion($url, $total_items, $per_page, $start, 3, 'pageoftotal');
		echo $pagination;
		?></div>
		<?php
		$num = bdd_pg_num_rows($rs);
		if ($num > 0) { 
			?>
			<table  border="0" cellpadding="2" cellspacing="0" class="dataTable" width="100%">
  			<thead>
    			<?php
			$numf = pg_num_fields($rs);
			?>
    			<tr>
      			<?php
			$i = 0;
			while ($i < $numf  ) {
				$meta = pg_field_name($rs,$i); 
				$fname = $meta;
				switch ($fname) {
					case 'id_rol':
						$fname = "ID";
					break;
					case 'rol':
						$fname = "Nombre del Rol";
					break;
                				case 'descripcion':
						$fname = "Descripi&oacute;n del Rol";
					break;
					
				}
				?>
				<th rowspan="2"><?php echo $fname; ?></th>
      				<?php
				$i++;
			} 
			?>
			<?php echo (count($data)>0)? "<th colspan=\"".count($data)."\" >".$actions."</th>" : NULL; ?> </tr>
			<tr>
      			<?php
			foreach($data as $value) {
				?>
      				<th><img align="middle" src="../../lib/<?php echo $value; ?>.png" alt="<?php echo $value; ?>" width="16" height="16" /></th>
     				<?php
			}
			?>
    			</tr>
 			</thead>
			<tbody>
    			<?php

			while ($reg = bdd_pg_fetch_row($result)) {
				?>
    				<tr>
      				<?php
				$i = 0;
				while ($i < $numf ) {
 					switch ($i) {
						default:
							?>
      							<td><?php 
							echo $reg[$i]; 
							?></td>
      							<?php
						break;
					}	
					$i++;
				}
				foreach($data as $value) {
					if ($value =='Borrar'){
						?>
						<td><a href="#" onClick="disp_confirm('index.php?action=borrar&id=<?php echo $reg[0] ?>','no','&iquest; Esta seguro que quiere eliminar este registro ID:<?php echo $reg[0]?>?');"><?php echo $value; ?> </a></td>
						<?php 
					} 
					else 
					{ ?>
					<td><a href="<?php  $_SERVER['PHP_SELF']?> index.php?action=<?php echo strtolower($value); ?>&amp;id=<?php echo $reg[0]?>"> <?php echo $value; ?></a></td>
					<?php 
					}
				}
				?>
				</tr>
    				<?php
			} 
			?>
  			</tbody>
  			<?php
			?>
			</table>
			<?php
		} 
	} 
bdd_cerrar($cnx);
}

function editar_rol($id){
    $cnx = bdd_conectar();
	$q = '	SELECT id_rol, rol, descripcion  FROM roles where id_rol='.$id;
	$rs = bdd_pg_query($cnx, $q);
	if ($rs) { 
		$reg = bdd_pg_fetch_row($rs);	?>
		<h3>Editar Una Opcion de Menu</h3>
		<form action="<?php echo $_SERVER['PHP_SELF']?>?action=guardar" method="POST" id="edit" name="edit" >
			<fieldset ><legend> Editar Una Opcion de Menu </legend>
                            <table width="100%" align="center">
                                    <TR class="frm-fld-x-odd">
                                            <TD width="20%">Nombre de la Opcion</TD>
                                            <TD width="80%">
                                                    <input type='text' tabindex="1" name="rol" id="rol" maxlength="50" size="50" value="<?php echo $reg[1] ?>" />
                                            </TD>
                                    </TR>
                                   <TR class="frm-fld-x">
                                            <TD width="20%">Descripcion del Rol</TD>
                                            <TD width="80%">
                                                    <textarea tabindex="2" name="descripcion" id="descripcion" rows="7" cols="80"><?php echo $reg[2] ?></textarea>
                                            </TD>			
                                    </TR>
                            </table>
                            <table width="100%">
                                <tr class="frm-fld-x-odd">
                                    <TD colspan="1" align="center">
                                        <input type="hidden" name="action" value="guardar" />
                                        <input type="hidden" name="id" value="<?php echo $reg[0];?>" />
                                        <label for="Add">&nbsp;</label>
                                        <input tabindex="4" class="frm-btn-x" type="submit" name="Edit" title="Guardar" id="Edit" value="Guardar" />
                                        <input tabindex="5" class="frm-btn-x" type="button" name="cancel" title="Cancelar" id="Cancel" value="Cancelar" onclick="javascript:window.location=('<?php echo $_SERVER['PHP_SELF'];?>');"/>
                                    </TD>
                                </tr>
                            </table>
                    </fieldset>
		</form>
		<script language="JavaScript" type="text/javascript"> var frmvalidator = new Validator("edit"); 
                    frmvalidator.addValidation("rol","req","Nombre del rol es requerido");
                    frmvalidator.addValidation("descripcion","req","Es requerida la descripcion del Rol");
                 </script>
		<?php 
	} else { ?>
		<p class="error">Id no encontrado</p>
		<?php 
	}
	bdd_cerrar($cnx);
}

function actualizar_rol($id){
	$cnx = bdd_conectar();
        $rol =(isset($_POST['rol'])) ? $_POST['rol'] : "";
        $descripcion =(isset($_POST['descripcion'])) ? $_POST['descripcion'] : "";
	$q = "UPDATE roles SET
			rol= 	'".$rol."'
		,	descripcion=           '".$descripcion."'
		where 	id_rol=        ".$id;
	$rs = bdd_pg_query($cnx, $q);
	$af = bdd_pg_affected_rows($rs);
	if ($af){ 
		?>
		<p class="ok">Registro modificado!</p>
		<p > Regresar a <a href="/indicadores/catalogos/roles/">Roles</a></p>
		<?php
	} else { 
		?>
		<p class="error">El registro no ha sufrido modificacion<br />
		<p > Regresar a <a href="/indicadores/catalogos/roles/">Roles</a></p>
		  <?php echo pssqli_error($cnx);
	}
	bdd_cerrar($cnx); 
}

function borrar_rol($id){
	if ($id == NULL) {
		?>
		<p class="error"> Id no v&aacute;lido, intente nuevamente.</p>
		<?php
	} else {
		$cnx = bdd_conectar();
                          $q = "DELETE FROM roles WHERE id_rol=".$id ;
                    $rs = @bdd_pg_query($cnx, $q);
                    if ($rs){
                        $num=@bdd_pg_num_rows($rs);
                            ?>
                            <p class="ok"> Borrado exitosamente.</p>
                            <p > Regresar a <a href="/indicadores/catalogos/roles/">Roles</a></p>
                            <?php
                    } else {
                            ?>
                            <p class="error">ha ocurrido un error, no eliminado, intente nuevamente.</p>
                             <?php
                    }
	}
        bdd_cerrar($cnx);
}
?>

