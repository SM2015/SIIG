<?php
function agregar_variable(){
$cnx=bdd_conectar(); ?>
<form action="<?php echo $_SERVER['PHP_SELF']?>?action=guardarnuevo" method="POST" id="add" name="add">
<h3 class="frm-title-x">Agregar una variable</h3>
	<fieldset ><legend> Ingreso de una variable</legend>
	<table width="100%" align="center">
		<TR class="frm-fld-x-odd">
			<TD width="20%">Sentencia SQL</TD>
			<TD width="80%">
				<select name="id_sentencia" tabindex="1" size="1" id="id_sentencia" onchange="document.add.id_web_service.disabled='true';
                                        document.add.id_web_service.selected=0;" >
					<option selected="selected"> [Seleccione Uno ..]</option>
					<?php general_fillCmb('sentencia', 'id_sentencia', 'id_sentencia', 'nombre_consulta', NULL, NULL, $cnx); ?>
				</select>
			</TD>
		</TR>
		<TR class="frm-fld-x">
			<TD width="20%">Web Service</TD>
			<TD width="80%">
				<select name="id_web_service" tabindex="2" size="1" id="id_web_service" onchange="document.add.id_sentencia.disabled='true';
                                        document.add.id_sentencia.selected=0;">
                                    <option selected="selected"> [Seleccione Uno ..]</option>
					<?php general_fillCmb('web_service', 'id_web_service', 'id_web_service', 'nombre_web_service', NULL, NULL, $cnx); ?>
				</select>
			</TD>
		</TR>
		<TR class="frm-fld-x-odd">
			<TD width="20%">Nombre de la variable</TD>
			<TD>
				<input type='text' tabindex="3" name="nombre" id="nombre" maxlength="100" size="100" onblur="pl(this);" />
			</TD>
		</TR>
		<TR class="frm-fld-x">
			<TD width="20%">Iniciales de la Variable</TD>
			<TD>
				<input type='text' tabindex="4" name="iniciales" id="iniciales" maxlength="10" size="10" onkeyup = "this.value=this.value.toUpperCase()" />
			</TD>
		</TR>

                <TR class="frm-fld-x-odd">
			<TD width="20%">Fuente de datos</TD>
			<TD width="80%">
				<select name="id_fuente" tabindex="5" size="1" id="id_fuente">
					<option selected="selected"> [Seleccione Uno ..]</option>
					<?php general_fillCmb('fuente_dato', 'id_fuente', 'id_fuente_dato', 'nombre', NULL, NULL, $cnx); ?>
				</select>
			</TD>
		</TR>
		<TR class="frm-fld-x">
			<TD width="20%">Responsable del datos</TD>
			<TD width="80%">
				<select name="id_responsable" tabindex="6" size="1" id="id_responsable">
					<option selected="selected"> [Seleccione Uno ..]</option>
					<?php general_fillCmb('responsable_dato', 'id_responsable', 'id_responsable_dato', 'nombre', NULL, NULL, $cnx); ?>
				</select>
			</TD>
		</TR>
		<TR class="frm-fld-x-odd">
			<TD width="20%">Confiabilidad del dato</TD>
			<TD width="80%">
                           <body class="yui-skin-sam">
                           <div id="slider-bg" class="yui-h-slider" tabindex="-1" title="Confiabilidad">
                           <div id="slider-thumb" class="yui-slider-thumb"><img src="../../addons/yui1/examples/slider/assets/thumb-n.gif"></div>
                           </div>
                           <span id="slider-value"></span>
                           <input autocomplete="off" name="confiabilidad" id="confiabiliada" type="text" value="0" size="3" maxlength="3" onkeypress='validate(event)'/>%
                            </body>
                        </TD>
		</TR>
                <TR class="frm-fld-x">
			<TD width="20%">Comentario</TD>
			<TD width="80%">
				<textarea tabindex="8" name="comentario" id="comentario" rows="8" cols="80"></textarea>
			</TD>			
		</TR>
	</table>
	<table width="100%">	
		<tr class="frm-fld-x-odd" colspan="1">
			<TD width="100%"  align="center">
				<input type="hidden" name="action" value="guardarnuevo" />
				<label for="Add">&nbsp;</label>
				<input tabindex="9" class="frm-btn-x" type="submit" name="add" title="Agregar Nuevo" id="Add" value="Adicionar" />
				<input tabindex="10" class="frm-btn-x" type="button" name="cancel" title="Cancelar" id="Cancel" value="Cancelar" onclick="javascript:window.location=('index.php');" />
				
			</TD>
		</tr>
</table>
</fieldset>
</form>
<script language="JavaScript" type="text/javascript"> var frmvalidator = new Validator("add");
frmvalidator.addValidation("nombre","req","Nombre de la varaible es requerido");
frmvalidator.addValidation("iniciales","req","Iniciales de la varaible es requerido");
frmvalidator.addValidation("id_fuente","dontselect=0","El nombre de la Fuente es requerido");
frmvalidator.addValidation("id_responsable","dontselect=0","El nombre del Responsable es requerido");
(function() {
    var Event = YAHOO.util.Event,
        Dom   = YAHOO.util.Dom,
        lang  = YAHOO.lang,
        slider,
        bg="slider-bg", thumb="slider-thumb",
        valuearea="slider-value", textfield="confiabiliada"
    var topConstraint = 0;
    var bottomConstraint = 200;
    var scaleFactor =0.5;
    Event.onDOMReady(function() {
        slider = YAHOO.widget.Slider.getHorizSlider(bg, thumb, topConstraint, bottomConstraint, 5);
        slider.animate = true;
        slider.getRealValue = function() {
            return Math.round(this.getValue() * scaleFactor);
        }
      slider.subscribe("change", function(offsetFromStart) {
            var valnode = Dom.get(valuearea);
            var fld = Dom.get(textfield);
             var actualValue = slider.getRealValue();
            fld.value = actualValue;
           Dom.get(bg).title = "Valor actual = " + actualValue;
        });
      Event.on(textfield, "keydown", function(e) {
           if (Event.getCharCode(e) === 13) {
                var v = parseFloat(this.value, 10);
                v = (lang.isNumber(v)) ? v : 0;
                slider.setValue(Math.round(v/scaleFactor));
            }
        });
    });
})();
                   function pl(txt1){
                         txt=txt1.value;
                          var result = txt.replace(/([A-Za-zÁÉÍÓÚáéíóú])([A-Za-z0-9ÁÉÍÓÚáéíóú]+)(\-|\s|$)/g, "$1");
                         result = result.replace(/Á/,"A")
                         result = result.replace(/É/,"E")
                         result = result.replace(/Í/,"I")
                         result = result.replace(/Ó/,"O")
                         result = result.replace(/Ú/,"U")
                         result = result.replace(/á/,"a")
                         result = result.replace(/é/,"e")
                         result = result.replace(/í/,"i")
                         result = result.replace(/ó/,"o")
                         result = result.replace(/ú/,"u")
                         result = result.replace(/#/,"N")
                         str=result;
                         var str = result.split('');
                         result='';
                         for(i=0; i<=str.length-1; i++) {
                                str[i] = str[i].toUpperCase();
                                result+=str[i];
                            }
                         document.getElementById('iniciales').value=result;
                    }
</script> <?php
bdd_cerrar($cnx);
}

function grabar_nuevo_variable(){
$cnx = bdd_conectar();
$id_sentencia =(isset($_POST['id_sentencia'])) ? $_POST['id_sentencia'] : 0;
$id_web_service =(isset($_POST['id_web_service'])) ? $_POST['id_web_service'] : 0;
$iniciales =(isset($_POST['iniciales'])) ? $_POST['iniciales'] : "";
$nombre =(isset($_POST['nombre'])) ? $_POST['nombre'] : "";
$id_fuente =(isset($_POST['id_fuente'])) ? $_POST['id_fuente'] : "";
$id_responsable =(isset($_POST['id_responsable'])) ? $_POST['id_responsable'] : "";
$confiabilidad =(isset($_POST['confiabilidad'])) ? $_POST['confiabilidad'] : "";
$comentario =(isset($_POST['comentario'])) ? $_POST['comentario'] : "";
$q = "INSERT INTO variable_dato( id_sentencia, id_web_service, nombre, iniciales ,id_fuente, id_responsable, confiabilidad, comentario)
    VALUES (
  ".$id_sentencia." ,
  ".$id_web_service." ,
  '".$nombre."',
  '".$iniciales."',
  ".$id_fuente.",
  ".$id_responsable.",
  ".$confiabilidad .",
  '".$comentario."' )";
	$rs = bdd_pg_query($cnx, $q);
	$af = bdd_pg_affected_rows($rs);
	if ($af){ 
		?>
		<p class="ok">Registro modificado!</p>
		<p > Regresar a <a href="/indicadores/formula/variable/">Variables</a></p>
		<?php
	} else { 
		?>
		<p class="error">El registro no ha sufrido modificacion<br />
		<p > Regresar a <a href="/indicadores/formula/variable/">Variables</a></p>
		<?php echo pg_error($cnx);?> <?php
	}
	bdd_cerrar($cnx);
}

function listarTodos($table, $data, $url , $fields = '*', $per_page = 20) {
	$cnx = bdd_conectar();
	$actions = "Acciones";
	$aAdd = "Activar";
	$aEdit = "Bloquear";
	$aDelete = "Asignar";
	$q = "SELECT variable_dato.id_variable, fuente_dato.nombre as fuente, responsable_dato.nombre as responsable, variable_dato.nombre ,
        variable_dato.iniciales , variable_dato.confiabilidad, 'Sentencia SQL: ' || sentencia.nombre_consulta as consulta
        FROM public.variable_dato, public.sentencia, public.fuente_dato, public.responsable_dato
        WHERE variable_dato.id_sentencia = sentencia.id_sentencia AND variable_dato.id_responsable =
        responsable_dato.id_responsable_dato AND variable_dato.id_fuente = fuente_dato.id_fuente_dato 
        union
        SELECT variable_dato.id_variable, fuente_dato.nombre as fuente, responsable_dato.nombre as responsable, variable_dato.nombre,
        variable_dato.iniciales , variable_dato.confiabilidad, 'Web Service: ' || web_service.nombre_web_service as consulta
        FROM public.variable_dato, public.web_service, public.fuente_dato, public.responsable_dato
        WHERE variable_dato.id_responsable = responsable_dato.id_responsable_dato AND
        variable_dato.id_fuente = fuente_dato.id_fuente_dato AND web_service.id_web_service <> 0 and
        variable_dato.id_web_service = web_service.id_web_service order by id_variable";
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
                    $q1=$q." LIMIT ".$per_page;
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
					case 'id_variable':
						$fname = "ID";
					break;
					case 'fuente':
						$fname = "Fuente de Datos";
					break;
					case 'responsable':
						$fname = "Responsable del Dato";
					break;
					case 'nombre':
						$fname = "Nombre de la Variable";
					break;
					case 'iniciales':
						$fname = "Iniciales";
					break;
					case 'confiabilidad':
						$fname = "Confiabilidad en %";
					break;

					case 'consulta':
						$fname = "Consulta SQL / Web Service";
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

function editar_variable($id){
	$cnx = bdd_conectar();
	$q = '	SELECT id_variable, id_sentencia, id_web_service, nombre, iniciales ,id_fuente, id_responsable, confiabilidad, comentario
                FROM public.variable_dato where id_variable='.$id;
	$rs = bdd_pg_query($cnx, $q);
	if ($rs) { 
		$reg = bdd_pg_fetch_row($rs)
		?>
		<h3>Editar Una Variable</h3>
		<form action="<?php echo $_SERVER['PHP_SELF']?>?action=guardar" method="POST" id="edit" name="edit" >
			<fieldset ><legend> Editar una Variable </legend>
                               <table width="100%" align="center">
                                    <TR class="frm-fld-x-odd">
                                            <TD width="20%">Sentencia SQL</TD>
                                            <TD width="80%">
                                                    <select name="id_sentencia" tabindex="1" size="1" id="id_sentencia" onchange="document.edit.id_web_service.disabled='true';
                                        document.add.id_web_service.selected=0;">
                                                            <option selected="selected"> [Seleccione Uno ..]</option>
                                                            <?php general_fillCmb('sentencia', 'id_sentencia', 'id_sentencia', 'nombre_consulta',$reg[1] , NULL, $cnx); ?>
                                                    </select>
                                            </TD>
                                    </TR>
                                    <TR class="frm-fld-x">
                                            <TD width="20%">Web Service</TD>
                                            <TD width="80%">
                                                    <select name="id_web_service" tabindex="2" size="1" id="id_web_service" onchange="document.edit.id_sentencia.disabled='true';
                                        document.add.id_sentencia.selected=0;">
                                                            <option selected="selected"> [Seleccione Uno ..]</option>
                                                            <?php general_fillCmb('web_service', 'id_web_service', 'id_web_service', 'nombre_web_service', $reg[2], NULL, $cnx); ?>
                                                    </select>
                                            </TD>
                                    </TR>
                                    <TR class="frm-fld-x-odd">
                                            <TD width="20%">Nombre de la variable</TD>
                                            <TD>
                                                <textarea tabindex="3"  name="nombre" id="nombre" rows="3" cols="80" ><?php echo $reg[3]; ?></textarea>
                                            </TD>
                                    </TR>
                                    <TR class="frm-fld-x">
                                            <TD width="20%">Iniciales de la variable</TD>
                                            <TD>
                                                    <input type='text' tabindex="4" name="iniciales" id="iniciales" maxlength="10" size="10" value="<?php echo $reg[4] ;?>" onkeyup = "this.value=this.value.toUpperCase()" />
                                            </TD>
                                    </TR>

                                    <TR class="frm-fld-x-odd">
                                            <TD width="20%">Fuente de datos</TD>
                                            <TD width="80%">
                                                    <select name="id_fuente" tabindex="4" size="1" id="id_fuente">
                                                            <option selected="selected"> [Seleccione Uno ..]</option>
                                                            <?php general_fillCmb('fuente_dato', 'id_fuente', 'id_fuente_dato', 'nombre', $reg[5], NULL, $cnx); ?>
                                                    </select>
                                            </TD>
                                    </TR>
                                    <TR class="frm-fld-x">
                                            <TD width="20%">Responsable del datos</TD>
                                            <TD width="80%">
                                                    <select name="id_responsable" tabindex="5" size="1" id="id_responsable">
                                                            <option selected="selected"> [Seleccione Uno ..]</option>
                                                            <?php general_fillCmb('responsable_dato', 'id_responsable', 'id_responsable_dato', 'nombre', $reg[6], NULL, $cnx); ?>
                                                    </select>
                                            </TD>
                                    </TR>
                                    <TR class="frm-fld-x-odd">
                                            <TD width="20%">Confiabilidad del dato</TD>
                                            <TD width="80%">
                                                <body class="yui-skin-sam">
                                                <div id="slider-bg" class="yui-h-slider" tabindex="-1" title="Confiabilidad">
                                                <div id="slider-thumb" class="yui-slider-thumb"><img src="../../addons/yui1/examples/slider/assets/thumb-n.gif"></div>
                                                </div>
                                                <span id="slider-value"></span>
                                                <input autocomplete="off" name="confiabilidad" id="confiabiliada" type="text" value="<?php echo $reg[7] ;?>" size="3" maxlength="3" onkeypress='validate(event)'/>
                                                </body>
                                            </TD>
                                    </TR>
                                    <TR class="frm-fld-x">
                                            <TD width="20%">Comentario</TD>
                                            <TD width="80%">
                                                    <textarea tabindex="8" name="comentario" id="comentario" rows="8" cols="80"><?php echo $reg[8] ;?></textarea>
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
                    frmvalidator.addValidation("nombre","req","Nombre de la varaible es requerido");
                    frmvalidator.addValidation("id_fuente","dontselect=0","El nombre de la Fuente es requerido");
                    frmvalidator.addValidation("id_responsable","dontselect=0","El nombre del Responsable es requerido");
                    (function() {
                        var Event = YAHOO.util.Event,
                            Dom   = YAHOO.util.Dom,
                            lang  = YAHOO.lang,
                            slider,
                            bg="slider-bg", thumb="slider-thumb",
                            valuearea="slider-value", textfield="confiabiliada"
                        var topConstraint = 0;
                        var bottomConstraint = 200;
                        var scaleFactor =0.5;
                        Event.onDOMReady(function() {
                            slider = YAHOO.widget.Slider.getHorizSlider(bg, thumb, topConstraint, bottomConstraint, 5);
                            slider.animate = true;
                            slider.getRealValue = function() {
                                return Math.round(this.getValue() * scaleFactor);
                            }
                          slider.subscribe("change", function(offsetFromStart) {
                                var valnode = Dom.get(valuearea);
                                var fld = Dom.get(textfield);
                                 var actualValue = slider.getRealValue();
                                fld.value = actualValue;
                               Dom.get(bg).title = "Valor actual = " + actualValue;
                            });
                          Event.on(textfield, "keydown", function(e) {
                               if (Event.getCharCode(e) === 13) {
                                    var v = parseFloat(this.value, 10);
                                    v = (lang.isNumber(v)) ? v : 0;
                                    slider.setValue(Math.round(v/scaleFactor));
                                }
                            });
                        });
                    })();
                    function pl(txt1){
                         txt=txt1.value;
                          var result = txt.replace(/([A-Za-zÁÉÍÓÚáéíóú])([A-Za-z0-9ÁÉÍÓÚáéíóú]+)(\-|\s|$)/g, "$1");
                         result = result.replace(/Á/,"A")
                         result = result.replace(/É/,"E")
                         result = result.replace(/Í/,"I")
                         result = result.replace(/Ó/,"O")
                         result = result.replace(/Ú/,"U")
                         result = result.replace(/á/,"a")
                         result = result.replace(/é/,"e")
                         result = result.replace(/í/,"i")
                         result = result.replace(/ó/,"o")
                         result = result.replace(/ú/,"u")
                         str=result;
                         var str = result.split('');
                         result='';
                         for(i=0; i<=str.length-1; i++) {
                                str[i] = str[i].toUpperCase();
                                result+=str[i];
                            }
                         document.getElementById('iniciales').value=result;
                    }
  
		</script>
		<?php 
	} else { ?>
		<p class="error">Id no encontrado</p>
		<?php 
	}
	bdd_cerrar($cnx);
}

function actualizar_variable($id){
	$cnx = bdd_conectar();
        $id_sentencia =(isset($_POST['id_sentencia'])) ? $_POST['id_sentencia'] : 0;
        $id_web_service =(isset($_POST['id_web_service'])) ? $_POST['id_web_service'] : 0;
        if ( $id_sentencia == "[Seleccione Uno ..]" ){
            $id_sentencia=0;
        }
               if ( $id_web_service == "[Seleccione Uno ..]" ){
            $id_web_service=0;
        }
        $nombre =(isset($_POST['nombre'])) ? $_POST['nombre'] : "";
        $iniciales =(isset($_POST['iniciales'])) ? $_POST['iniciales'] : "";
        $id_fuente =(isset($_POST['id_fuente'])) ? $_POST['id_fuente'] : "";
        $id_responsable =(isset($_POST['id_responsable'])) ? $_POST['id_responsable'] : "";
        $confiabilidad =(isset($_POST['confiabilidad'])) ? $_POST['confiabilidad'] : "";
        $comentario =(isset($_POST['comentario'])) ? $_POST['comentario'] : "";
	$q = "UPDATE variable_dato SET
			id_sentencia= 	".$id_sentencia."
		,	id_web_service= ".$id_web_service."
		,	nombre= 	'".$nombre."'
		,	iniciales= 	'".$iniciales."'
                ,	id_fuente= 	".$id_fuente."
		,	id_responsable= ".$id_responsable."
		,	confiabilidad= 	".$confiabilidad."
                ,	comentario= 	'".$comentario."'
		where 	id_variable=".$id;
	$rs = bdd_pg_query($cnx, $q);
	$af = bdd_pg_affected_rows($rs);
	if ($af){ 
		?>
		<p class="ok">Registro modificado!</p>
		<p > Regresar a <a href="/indicadores/formula/variable/">Variables</a></p>
		<?php
	} else { 
		?>
		<p class="error">El registro no ha sufrido modificacion<br />
		<p > Regresar a <a href="/indicadores/formula/variable/">Variables</a></p>
		  <?php echo pg_error($cnx);?></p>
		<?php
	}


	bdd_cerrar($cnx); 
}

function borrar($id = NULL){
	if ($id == NULL) {
		?>
		<p class="error"> Id no v&aacute;lido, intente nuevamente.</p>
		<?php
	} else {
		$cnx = bdd_conectar();
		$id = general_limpiarCadena($cnx, $id);
		$q = "SELECT * FROM rechazo WHERE id = ".$id." LIMIT 1";
		$rs = bdd_my_query($cnx, $q);
		$num = bdd_my_num_rows($rs);
		if ($num == 1){
			$q = "DELETE FROM rechazo WHERE id = ".$id." LIMIT 1";
			$rs = bdd_my_query($cnx, $q);
			$num = bdd_my_affected_rows($cnx);
			if ($num == 1) {
				?>
				<p class="ok"> Borrado exitosamente.</p>
				<p > Regresar a <a href="">Rechazo</a></p>
				<?php
			} else { 
				?>
				<p class="error">ha ocurrido un error, no eliminado, intente nuevamente.</p>
				<p class="error">ERROR: <?php echo bdd_my_error($cnx); ?></p>
				<?php
			}
			
		} else { 
			?>
			<p class="error"> Id no encontrado o est� en un estado distintinto a "Asignada",
			intente nuevamente.</p>
			<p > Regresar a <a href="">Rechazo</a></p>
			<?php
		}

	}
}

?>