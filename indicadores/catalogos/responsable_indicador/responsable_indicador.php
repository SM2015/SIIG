<?php
function agregar_responsable_indicador(){
$cnx=bdd_conectar(); ?>
<form action="<?php echo $_SERVER['PHP_SELF']?>?action=guardarnuevo" method="POST" id="add" name="add">
<h3 class="frm-title-x">Agregar un Responsable de Indicador</h3>
	<fieldset ><legend> Ingreso de un Responsable de Indicador</legend>
	<table width="100%" align="center">
		<TR class="frm-fld-x-odd">
			<TD width="20%">Nombre del Responsable del Indicador</TD>
			<TD width="80%">
				<input type='text' tabindex="1" name="nombre" id="nombre" maxlength="100" size="100" />
			</TD>
		</TR>
		<TR class="frm-fld-x">
			<TD width="20%">Nombre de la Persona Contacto</TD>
			<TD width="80%">
				<input type='text' tabindex="2" name="contacto" id="contacto" maxlength="100" size="100" />
			</TD>
		</TR>
		<TR class="frm-fld-x-odd">
			<TD width="20%">Correo electronico de la persona contacto</TD>
			<TD>
				<input type='text' tabindex="3" name="correo" id="correo" maxlength="50" size="50" onblur="valEmail(this);" />
			</TD>
		</TR>
		<TR class="frm-fld-x">
			<TD width="20%">Numero telefonico de la persona contacto</TD>
			<TD width="80%">
				<input type='text' tabindex="4" name="telefono" id="telefono" maxlength="9" size="9" onblur="valTel(this);" /> <small> Formato ####-####</small>
			</TD>
		</TR>
		<TR class="frm-fld-x-odd">
			<TD width="20%">Cargo de la persona contacto</TD>
			<TD width="80%">
				<input type='text' tabindex="5" name="cargo" id="cargo" maxlength="50" size="50" />
			</TD>
		</TR>
	</table>
	<table width="100%">	
		<tr class="frm-fld-x" colspan="1">
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
frmvalidator.addValidation("nombre","req","Nombre de la Dependencia o institucion es requerido");
frmvalidator.addValidation("contacto","req","Nombre de la persona contacto es requerido");
frmvalidator.addValidation("correo","req","Correo electronico  es requerido");
frmvalidator.addValidation("telefono","req","Numero telefonico es requerido");
frmvalidator.addValidation("cargo","req","Cargo de la persona contacto es requerido");
</script>
 <?php
bdd_cerrar($cnx);
}

function grabar_nuevo_responsable_indicador(){
$cnx = bdd_conectar();
$nombre =(isset($_POST['nombre'])) ? $_POST['nombre'] : "";
$contacto =(isset($_POST['contacto'])) ? $_POST['contacto'] : "";
$correo =(isset($_POST['correo'])) ? $_POST['correo'] : "";
$telefono =(isset($_POST['telefono'])) ? $_POST['telefono'] : "";
$cargo =(isset($_POST['cargo'])) ? $_POST['cargo'] : "";

$q = "INSERT INTO responsable_indicador ( nombre, contacto, correo, telefono, cargo )
    VALUES (
  '".$nombre."' ,
  '".$contacto."' ,
  '".$correo."' ,
  '".$telefono."',
  '". $cargo ."')";
	$rs = bdd_pg_query($cnx, $q);
	$af = bdd_pg_affected_rows($rs);
	if ($af){ 
		?>
		<p class="ok">Registro modificado!</p>
		<p > Regresar a <a href="/indicadores/catalogos/responsable_indicador/">Responsable del Indicador</a></p>
		<?php
	} else { 
		?>
		<p class="error">El registro no ha sufrido modificacion<br />
		<p > Regresar a <a href="/indicadores/catalogos/responsable_indicador/">Responsable del Indicador</a></p>
		<?php echo pg_error($cnx);?></p>
		<?php
	}
	bdd_cerrar($cnx);
}

function listarTodos($table, $data, $url , $fields = '*', $per_page = 10) {
	$cnx = bdd_conectar();
	$actions = "Acciones";
	$aAdd = "Activar";
	$aEdit = "Bloquear";
	$aDelete = "Asignar";
	$q = 'SELECT '.$fields.' FROM '.$table;
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
					case 'id_responsable_indicador':
						$fname = "ID";
					break;
					case 'nombre':
						$fname = "Nombre del establecimiento o dependencia responsable del indicador";
					break;
					case 'contacto':
						$fname = "Nombre de la Persona Contacto";
					break;
					case 'correo':
						$fname = "Correo Electronico";
					break;
					case 'telefono':
						$fname = "Numero de Telefono";
					break;

					case 'cargo':
						$fname = "Cargo";
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

function editar_responsable_indicador($id){
	$cnx = bdd_conectar();
	$q = '	SELECT id_responsable_indicador, nombre, contacto, correo, telefono, cargo
  FROM responsable_indicador where id_responsable_indicador='.$id;
	$rs = bdd_pg_query($cnx, $q);
	if ($rs) { 
		$reg = bdd_pg_fetch_row($rs)
		?>
		<h3>Editar Un Responsable del Indicador</h3>
		<form action="<?php echo $_SERVER['PHP_SELF']?>?action=guardar" method="POST" id="edit" name="edit" >
			<fieldset ><legend> Editar Un responsable del Indicador</legend>
	<table width="100%" align="center">
		<TR class="frm-fld-x-odd">
			<TD width="20%">Nombre del Responsable del Indicador</TD>
			<TD width="80%">
				<input type='text' tabindex="1" name="nombre" id="nombre" maxlength="100" size="100" value="<?php echo $reg[1]; ?>" />
			</TD>
		</TR>
		<TR class="frm-fld-x">
			<TD width="20%">Nombre de la Persona Contacto</TD>
			<TD width="80%">
				<input type='text' tabindex="2" name="contacto" id="contacto" maxlength="100" size="100" value="<?php echo $reg[2]; ?>" />
			</TD>
		</TR>
		<TR class="frm-fld-x-odd">
			<TD width="20%">Correo electronico de la persona contacto</TD>
			<TD>
				<input type='text' tabindex="3" name="correo" id="correo" maxlength="50" size="50" value="<?php echo $reg[3]; ?>" onblur="valEmail(this);" />
			</TD>
		</TR>
		<TR class="frm-fld-x">
			<TD width="20%">Numero telefonico de la persona contacto</TD>
			<TD width="80%">
				<input type='text' tabindex="4" name="telefono" id="telefono" maxlength="10" size="10" value="<?php echo $reg[4]; ?>" onblur="valTel(this);" /> <small> Formato ####-####</small>
			</TD>
		</TR>
		<TR class="frm-fld-x-odd">
			<TD width="20%">Cargo de la persona contacto</TD>
			<TD width="80%">
				<input type='text' tabindex="5" name="cargo" id="cargo" maxlength="50" size="50" value="<?php echo $reg[5]; ?>" />
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
			frmvalidator.addValidation("nombre","req","Nombre de la Dependencia o institucion es requerido");
			frmvalidator.addValidation("contacto","req","Nombre de la persona contacto es requerido");
			frmvalidator.addValidation("correo","req","Correo electronico  es requerido");
			frmvalidator.addValidation("telefono","req","Numero telefonico es requerido");
			frmvalidator.addValidation("cargo","req","Cargo de la persona contacto es requerido");
		</script>
		<?php 
	} else { ?>
		<p class="error">Id no encontrado</p>
		<?php 
	}
	bdd_cerrar($cnx);
}

function actualizar_responsable_indicador($id){
	$cnx = bdd_conectar();
	$nombre =(isset($_POST['nombre'])) ? $_POST['nombre'] : "";
	$contacto =(isset($_POST['contacto'])) ? $_POST['contacto'] : "";
	$correo =(isset($_POST['correo'])) ? $_POST['correo'] : "";
	$telefono =(isset($_POST['telefono'])) ? $_POST['telefono'] : "";
	$cargo =(isset($_POST['cargo'])) ? $_POST['cargo'] : "";
	$q = "UPDATE responsable_indicador SET
			nombre= 	'".$nombre."'
		,	contacto= 	'".$contacto."'
		,	correo= 	'".$correo."'
		,	telefono= 	'".$telefono."'
		,	cargo= 		'".$cargo."'
		where 	id_responsable_indicador=".$id;
	$rs = bdd_pg_query($cnx, $q);
	$af = bdd_pg_affected_rows($rs);
	if ($af){ 
		?>
		<p class="ok">Registro modificado!</p>
		<p > Regresar a <a href="/indicadores/catalogos/responsable_indicador/">Responsable del Indicador</a></p>
		<?php
	} else { 
		?>
		<p class="error">El registro no ha sufrido modificacion<br />
		<p > Regresar a <a href="/indicadores/catalogos/responsable_indicador/">Responsable del Indicador</a></p>
		  <?php echo mysqli_error($cnx);?></p>
		<?php
	}
	bdd_cerrar($cnx); 
}

function borrar_responsable_indicador($id){
	if ($id == NULL) {
		?>
		<p class="error"> Id no v&aacute;lido, intente nuevamente.</p>
		<?php
	} else {
		$cnx = bdd_conectar();
                $q = "DELETE FROM responsable_indicador WHERE id_responsable_indicador=".$id;
                $rs = @bdd_pg_query($cnx, $q);
                if ($rs){
                    $num=@bdd_pg_num_rows($rs);
                        ?>
                        <p class="ok"> Borrado exitosamente.</p>
                        <p > Regresar a <a href="/indicadores/catalogos/responsable_indicador/">Responsable del Indicador</a></p>
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