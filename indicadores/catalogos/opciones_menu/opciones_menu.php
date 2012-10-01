<?php
function agregar_opciones_menu(){
$cnx=bdd_conectar(); ?>
<form action="<?php echo $_SERVER['PHP_SELF']?>?action=guardarnuevo" method="POST" id="add" name="add">
<h3 class="frm-title-x">Agregar una Opcion de Menu</h3>
	<fieldset ><legend> Ingreso de una Opcion de Menu</legend>
	<table width="100%" align="center">
		<TR class="frm-fld-x-odd">
			<TD width="20%">Nombre de la Opcion</TD>
			<TD width="80%">
				<input type='text' tabindex="1" name="nombre" id="nombre" maxlength="50" size="50" />
			</TD>
		</TR>
		<TR class="frm-fld-x">
			<TD width="20%">Es Principal</TD>
			<TD width="80%">
				<input type="radio" name="principal" id="principal1" value="Si" onchange="esp();"> Si<br>
                                <input type="radio" name="principal" id="principal2" value="No" checked onchange="esp();"> No
			</TD>
		</TR>
		<TR class="frm-fld-x-odd">
			<TD width="20%">Opciones Principales</TD>
			<TD width="80%">
				<select name="id_padre" tabindex="2" size="1" id="id_padre">
					<option selected="selected"> [Seleccione Uno ..]</option>
					<?php general_fillCmb('opciones_menu', 'id_menu', 'id_menu', 'nombre', NULL, ' id_padre=0 ', $cnx); ?>
				</select>
			</TD>
		</TR>
		<TR class="frm-fld-x">
			<TD width="20%">Ruta de Ubicacion de Archivos</TD>
			<TD width="80%">
				<input type='text' tabindex="3" name="ruta" id="ruta" maxlength="100" size="100" />
			</TD>
		</TR>
		<TR class="frm-fld-x-odd">
			<TD width="20%">Esta Publicado</TD>
			<TD width="80%">
				<input type="radio" name="publicado" id="publicado1" value="Si" /> Si<br>
                                <input type="radio" name="publicado" id="publicado2" value="No" checked /> No
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
frmvalidator.addValidation("nombre","req","Nombre de la Opcion es requerido");
frmvalidator.addValidation("ruta","req","Ruta de la Opcion es requerida");
function esp(){
       if (document.add.principal1.checked){
      
          document.add.id_padre.disabled='true';
       }
       if (document.add.principal2.checked){
          document.add.id_padre.disabled=false;
       }
}
</script>
 <?php
bdd_cerrar($cnx);
}

function grabar_nuevo_opciones_menu(){
$cnx = bdd_conectar();
$nombre =(isset($_POST['nombre'])) ? $_POST['nombre'] : "";
$principal =(isset($_POST['principal'])) ? $_POST['principal'] : "";
$id_padre =(isset($_POST['id_padre'])) ? $_POST['id_padre'] : "";
$ruta =(isset($_POST['ruta'])) ? $_POST['ruta'] : "";
$publicado =(isset($_POST['publicado'])) ? $_POST['publicado'] : "";
if ($principal=='Si'){
    $id_padre=0;
}
if ($publicado=='Si'){
    $publicado=1;
}else{
    $publicado=0;
}
$q = "INSERT INTO opciones_menu( nombre, id_padre, ruta, publicado)
    VALUES (
  '".$nombre."' ,
  '".$id_padre."' ,
  '".$ruta."' ,
  '".$publicado."')";
	$rs = bdd_pg_query($cnx, $q);
	$af = bdd_pg_affected_rows($rs);
	if ($af){ 
		?>
		<p class="ok">Registro modificado!</p>
		<p > Regresar a <a href="/indicadores/catalogos/opciones_menu/">Opciones de Menu</a></p>
		<?php
	} else { 
		?>
		<p class="error">El registro no ha sufrido modificacion<br />
		<p > Regresar a <a href="/indicadores/catalogos/opciones_menu/">Opciones de Menu</a></p>
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
	$q = 'SELECT '.$fields.' FROM '.$table.' order by id_menu';
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
					case 'id_menu':
						$fname = "ID";
					break;
					case 'nombre':
						$fname = "Nombre de la Opcion de menu";
					break;
                				case 'id_padre':
						$fname = "Este Menu depende de / Es Principal";
					break;
					case 'ruta':
						$fname = "Ruta de Publicacion en el servidor";
					break;
					case 'publicado':
						$fname = "Publicado";
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
                                            	case 2:	?>
                                                        <td><?php
							if ($reg[$i]==0){
                                                            $datosmotor="Es Principal";
                                                            echo $datosmotor;
                                                        }else{
                                                            $idx = $reg[$i];
                                                            $datosmotor = general_sacarRegistroPorCondicion('opciones_menu', 'id_menu = '.$idx, $cnx, 'nombre');
                                                            echo $datosmotor[0];
                                                        }
							?></td> <?php
						break;
                                           	case 4:	?>
                                                        <td><?php
							if ($reg[$i]!=0){
                                                             echo 'Publicado';
                                                        }else{
                                                             echo 'No Publicado';
                                                        }
							?></td> <?php
						break;

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

function editar_opciones_menu($id){
    $cnx = bdd_conectar();
	$q = '	SELECT id_menu, nombre, id_padre, ruta, publicado  FROM opciones_menu where id_menu='.$id;
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
				<input type='text' tabindex="1" name="nombre" id="nombre" maxlength="50" size="50" value="<?php echo $reg[1] ?>" />
			</TD>
		</TR>
		<TR class="frm-fld-x">
			<TD width="20%">Es Principal</TD>
			<TD width="80%">
                            <?php if($reg[2]!=0){ ?>
       				<input type="radio" name="principal" id="principal1" value="Si" onchange="esp();"> Si<br>
                                <input type="radio" name="principal" id="principal2" value="No" checked onchange="esp();"> No
                            <?php }else{ ?>
				<input type="radio" name="principal" id="principal1" value="Si" checked onchange="esp();"> Si<br>
                                <input type="radio" name="principal" id="principal2" value="No" onchange="esp();"> No
                            <?php } ?>
			</TD>
		</TR>
		<TR class="frm-fld-x-odd">
			<TD width="20%">Opciones Principales</TD>
			<TD width="80%">
                            <?php if($reg[2]==0){ ?>
                             <select disabled='true' name="id_padre" tabindex="2" size="1" id="id_padre">
                           <?php }else{ ?>
                             <select name="id_padre" tabindex="2" size="1" id="id_padre">
                            <?php } ?>
					<option selected="selected"> [Seleccione Uno ..]</option>
					<?php general_fillCmb('opciones_menu', 'id_menu', 'id_menu', 'nombre', $reg[2], ' id_padre=0 ', $cnx); ?>
                             </select>
			</TD>
		</TR>
		<TR class="frm-fld-x">
			<TD width="20%">Ruta de Ubicacion de Archivos</TD>
			<TD width="80%">
				<input type='text' tabindex="3" name="ruta" id="ruta" maxlength="100" size="100" value="<?php echo $reg[3] ?>" />
			</TD>
		</TR>
		<TR class="frm-fld-x-odd">
			<TD width="20%">Esta Publicado</TD>
			<TD width="80%">
                            <?php if($reg[4]==0){ ?>
                                   <input type="radio" name="publicado" id="publicado1" value="Si" /> Si<br>
                                   <input type="radio" name="publicado" id="publicado2" value="No" checked /> No
                           <?php }else{ ?>
                                  <input type="radio" name="publicado" id="publicado1" value="Si"  checked /> Si<br>
                                  <input type="radio" name="publicado" id="publicado2" value="No"/> No
                            <?php } ?>
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
                    frmvalidator.addValidation("nombre","req","Nombre de la Opcion es requerido");
                    frmvalidator.addValidation("ruta","req","Ruta de la Opcion es requerida");
                    function esp(){
                           if (document.edit.principal1.checked){
                              document.edit.id_padre.disabled='true';
                           }
                           if (document.edit.principal2.checked){
                              document.edit.id_padre.disabled=false;
                           }
                    }
		</script>
		<?php 
	} else { ?>
		<p class="error">Id no encontrado</p>
		<?php 
	}
	bdd_cerrar($cnx);
}

function actualizar_opciones_menu($id){
	$cnx = bdd_conectar();
        $nombre =(isset($_POST['nombre'])) ? $_POST['nombre'] : "";
        $principal =(isset($_POST['principal'])) ? $_POST['principal'] : "";
        $id_padre =(isset($_POST['id_padre'])) ? $_POST['id_padre'] : "";
        $ruta =(isset($_POST['ruta'])) ? $_POST['ruta'] : "";
        $publicado =(isset($_POST['publicado'])) ? $_POST['publicado'] : "";
        if ($principal=='Si'){
            $id_padre=0;
        }
        if ($publicado=='Si'){
            $publicado=1;
        }else{
            $publicado=0;
        }
	$q = "UPDATE opciones_menu SET
			nombre= 	'".$nombre."'
		,	id_padre= 	".$id_padre."
		,	ruta=           '".$ruta."'
		,	publicado= 	".$publicado."
		where 	id_menu=        ".$id;
	$rs = bdd_pg_query($cnx, $q);
	$af = bdd_pg_affected_rows($rs);
	if ($af){ 
		?>
		<p class="ok">Registro modificado!</p>
		<p > Regresar a <a href="/indicadores/catalogos/opciones_menu/">Opciones de Menu</a></p>
		<?php
	} else { 
		?>
		<p class="error">El registro no ha sufrido modificacion<br />
		<p > Regresar a <a href="/indicadores/catalogos/opciones_menu/">Opciones de Menu</a></p>
		  <?php echo mysqli_error($cnx);
	}
	bdd_cerrar($cnx); 
}

function borrar_opciones_menu($id){
	if ($id == NULL) {
		?>
		<p class="error"> Id no v&aacute;lido, intente nuevamente.</p>
		<?php
	} else {
		$cnx = bdd_conectar();
                $q = "DELETE FROM opciones_menu WHERE id_menu=".$id." and publicado=0 ";
                $rs = @bdd_pg_query($cnx, $q);
                if ($rs){
                    $num=@bdd_pg_num_rows($rs);
                        ?>
                        <p class="ok"> Borrado exitosamente.</p>
                        <p > Regresar a <a href="/indicadores/catalogos/opciones_menu/">Opciones de Menu</a></p>
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