<?php
function agregar_ficha(){
$cnx=bdd_conectar(); ?>
<form action="<?php echo $_SERVER['PHP_SELF']?>?action=guardarnuevo" method="POST" id="add" name="add">
<h3 class="frm-title-x">Agregar una Ficha Tecnica</h3>
	<fieldset ><legend> Ingreso de una Ficha Tecnica</legend>
	<table width="100%" align="center">
		<TR class="frm-fld-x-odd">
			<TD width="20%">Nombre del Indicador</TD>
			<TD width="80%">
				<input type='text' tabindex="1" name="nombre" id="nombre" maxlength="100" size="100" />
                        </TD>
		</TR>
		<TR class="frm-fld-x">
			<TD width="20%">Tema del Indicador</TD>
			<TD width="80%">
				<textarea tabindex="2" name="tema" id="tema" rows="3" cols="80"></textarea>
			</TD>
		</TR>
		<TR class="frm-fld-x-odd">
			<TD width="20%">Concepto del Indicador</TD>
			<TD>
				<textarea tabindex="3" name="concepto" id="concepto" rows="3" cols="80"></textarea>
			</TD>
		</TR>
		<TR class="frm-fld-x">
			<TD width="20%">Objetivo del Indicador</TD>
			<TD width="80%">
				<textarea tabindex="4" name="objetivo" id="objetivo" rows="3" cols="80"></textarea>
			</TD>
		</TR>
		<TR class="frm-fld-x-odd">
			<TD width="20%">Uso del Indicador</TD>
			<TD width="80%">
				<textarea tabindex="5" name="uso" id="uso" rows="3" cols="80"></textarea>
			</TD>
		</TR>
		<TR class="frm-fld-x">
			<TD width="20%">Definicion Operativa del Indicador</TD>
			<TD width="80%">
      				<textarea tabindex="6" name="definicion_operativa" id="definicion_operativa" rows="3" cols="80"></textarea>
                        </TD>
		</TR>
		<TR class="frm-fld-x-odd">
			<TD width="20%">Unidad de Medida del Indicador</TD>
			<TD width="80%">
				<input type="text" tabindex="7" name="unidad_medida" id="unidad_medida" size="50" maxlength="50" />
                        </TD>
		</TR>
                <TR class="frm-fld-x">
			<TD width="20%">Variables
			</TD>
			<TD><P>Disponibles </P>
				<select name="variable1" size="5" id="variable1">
					<?php general_fillCmbx('variable_dato', ' nombre', 'id_variable', $cnx); ?>
				</select>
				<div ><P>Acciones: <input type="button" title="Pasar de la lista Disponible a Seleccionado" value="\/" onclick="cambiar(1); botones();">
				<input type="button" value="/\" title="Pasar de la lista Seleccionado a Disponible" onclick="cambiar(0); botones();"></P></div><P>Seleccionados</P>
				<select name="variable[]" size="5" id="variable"  onblur="seleccionar(this);" multiple="true">
				</select>
			</TD>
                </TR>
                <TR class="frm-fld-x-odd">
			<TD width="20%">Formula</TD>
			<TD width="80%">
                                <div id="resultado1"> </div><div>
                                <input type="hidden" name="posicion" id="posicion" value="0" />
                                <input  class='frm-btn-x' type='button' name='cancel' title='Sumar' id='Cancel' value='+'  onclick='sumar()' />
                                <input  class='frm-btn-x' type='button' name='cancel' title='Sustraer' id='Cancel' value='-' onclick='restar()' />
                                <input  class='frm-btn-x' type='button' name='cancel' title='Multiplicar' id='Cancel' value='x' onclick='multiplicar()'/>
                                <input  class='frm-btn-x' type='button' name='cancel' title='Dividir' id='Cancel' value='/' onclick='dividir()'/>
                                <input  class='frm-btn-x' type='button' name='cancel' title='Abrir Parentesis(agrupacion visible)' id='Cancel' value='(' onclick='abrirv()'/>
                                <input  class='frm-btn-x' type='button' name='cancel' title='Cerrar Parentesis(agrupacion visible)' id='Cancel' value=')' onclick='cerrarv()'/>
                                <input  class='frm-btn-x' type='button' name='cancel' title='Abrir Parentesis(agrupacion invisible)' id='Cancel' value='{' onclick='abriri()'/>
                                <input  class='frm-btn-x' type='button' name='cancel' title='Cerrar Parentesis(agrupacion invisible)' id='Cancel' value='}' onclick='cerrari()'/>
                                <input  class='frm-btn-x' type='button' name='cancel' title='Exponencial' id='Cancel' value='^'  onclick='exponencial()'/>
                                <input  class='frm-btn-x' type='button' name='cancel' title='Raiz Cuadrada' id='Cancel' value='<?php echo '&#8730;'; ?>' onclick='raiz()' />
                                <input  class='frm-btn-x' type='button' name='cancel' title='Diez' id='Cancel' value='10' onclick='diez()'/>
                                <input  class='frm-btn-x' type='button' name='cancel' title='Cien' id='Cancel' value='100'  onclick='cien()'/>
                                <input  class='frm-btn-x' type='button' name='cancel' title='Un Mil' id='Cancel' value='1000' onclick='mil()' />
                            </div>
                            <div> 
                                <input  class='frm-btn-x' type='button' name='cancel1' title='Limpiar Formula' id='limpiar' value='Borrar formula'  onclick='limpiar1()' />
                            </div>
                            <textarea tabindex="8" name="formula" id="formula" rows="3" cols="80" onblur="posicionCursor(); compararps();" ></textarea> 
                            <div id="resultado"></div>
                            <input class='frm-btn-x' type='button' name='cancel1' title='Comprobar sintaxis de formula' id='verificar' value='Comprobar sintaxis de formula'  onclick='verificar()' />

                        </TD>
		</TR>

		<TR class="frm-fld-x">
			<TD width="20%">Clasificacion por Nivel de Uso</TD>
			<TD width="80%">
				<select name="id_clasificacion_nivel" tabindex="9" size="1" id="id_clasificacion_nivel">
					<option selected="selected"> [Seleccione Uno ..]</option>
					<?php general_fillCmb('clasificacion_nivel', 'id_clasificacion_nivel', 'id_clasificacion_nivel', 'descripcion', NULL, NULL, $cnx); ?>
				</select>
			</TD>
		</TR>
		<TR class="frm-fld-x-odd">
			<TD width="20%">Clasificacion Tecnica</TD>
			<TD width="80%">
				<select name="id_clasificacion_tecnica" tabindex="10" size="1" id="id_clasificacion_tecnica">
					<option selected="selected"> [Seleccione Uno ..]</option>
					<?php general_fillCmb('clasificacion_tecnica', 'id_clasificacion_tecnica', 'id_clasificacion_tecnica', 'descripcion', NULL, NULL, $cnx); ?>
				</select>
			</TD>
		</TR>
		<TR class="frm-fld-x">
			<TD width="20%">Clasificacion segun su Privacidad</TD>
			<TD width="80%">
				<select name="id_clasificacion_privacidad" tabindex="11" size="1" id="id_clasificacion_privacidad">
					<option selected="selected"> [Seleccione Uno ..]</option>
					<?php general_fillCmb('clasificacion_privacidad', 'id_clasificacion_privacidad', 'id_clasificacion_privacidad', 'descripcion', NULL, NULL, $cnx); ?>
				</select>
			</TD>
		</TR>
		<TR class="frm-fld-x-odd">
			<TD width="20%">Clasificacion Por su Uso</TD>
			<TD width="80%">
				<select name="id_clasificacion_uso" tabindex="12" size="1" id="id_clasificacion_uso">
					<option selected="selected"> [Seleccione Uno ..]</option>
					<?php general_fillCmb('clasificacion_uso', 'id_clasificacion_uso', 'id_clasificacion_uso', 'descripcion', NULL, NULL, $cnx); ?>
				</select>
			</TD>
		</TR>
                <TR class="frm-fld-x">
			<TD width="20%">Periodicidad
			</TD>
			<TD><P>Disponibles ---------------------> Seleccionados</P>
				<select name="periodo1" size="5" id="periodo1">
					<?php general_fillCmbx('cat_periodo_indicador', ' descripcion', 'id_periodo_indicador', $cnx); ?>
				</select>
				<input type="button" value="->" onclick="cambiar1(1)">
				<input type="button" value="<-" onclick="cambiar1(0)">
				<select name="periodos[]" size="5" onblur="seleccionar(this);" id="periodos" multiple="true">
				</select>
			</TD>
                </TR>
                <TR class="frm-fld-x-odd">
			<TD width="20%">Responsable del Indicador</TD>
			<TD width="80%">
				<select name="id_responsable_indicador" tabindex="13" size="1" id="id_responsable_indicador">
					<option selected="selected"> [Seleccione Uno ..]</option>
					<?php general_fillCmb('responsable_indicador', 'id_responsable_indicador', 'id_responsable_indicador', 'nombre', NULL, NULL, $cnx); ?>
				</select>
			</TD>
		</TR>
		<TR class="frm-fld-x">
			<TD width="20%">Confiabilidad del Indicador (%)</TD>
			<TD width="80%">
                           <body class="yui-skin-sam">
                           <div id="slider-bg" class="yui-h-slider" tabindex="-1" title="Confiabilidad">
                           <div id="slider-thumb" class="yui-slider-thumb"><img src="../../addons/yui1/examples/slider/assets/thumb-n.gif"></div>
                           </div>
                           <span id="slider-value"></span>
                           <input  align="right" autocomplete="off" name="confiabilidad" id="confiabiliada" type="text" value="0" size="3" maxlength="3" onkeypress='validate(event)'/>%
                            </body>
                        </TD>
		</TR>
                <TR class="frm-fld-x-odd">
			<TD width="20%">Estandar Nacional</TD>
			<TD width="80%">
      				<input  align="right" autocomplete="off" name="estandar" id="estandar" type="text" value="0" size="11" maxlength="11" onkeypress='validate(event)'/>%
                        </TD>
		</TR>
		<TR class="frm-fld-x">
			<TD width="20%">Observacion</TD>
			<TD width="80%">
      				<textarea tabindex="15" name="observacion" id="observacion" rows="3" cols="80"></textarea>
                        </TD>
		</TR>
                <TR class="frm-fld-x-odd">
			<TD width="20%">Presentacion
			</TD>
			<TD><P>Disponibles ---------------------> Seleccionados</P>
				<select name="presentacion1" size="5" id="presentacion1">
					<?php general_fillCmbx('cat_presentacion', ' descripcion', 'id_presentacion', $cnx); ?>
				</select>
				<input type="button" value="->" onclick="cambiar2(1)">
				<input type="button" value="<-" onclick="cambiar2(0)">
				<select name="presentacion[]"  onblur="seleccionar(this);" size="5" id="presentacion" multiple="true">
				</select>
			</TD>
                </TR>
        </table>
	<table width="100%">	
		<tr class="frm-fld-x" colspan="1">
			<TD width="100%"  align="center">
				<input type="hidden" name="action" value="guardarnuevo" />
				<label for="Add">&nbsp;</label>
				<input tabindex="17" class="frm-btn-x" type="submit" name="add" title="Agregar Nuevo" id="Add" value="Adicionar" />
				<input tabindex="18" class="frm-btn-x" type="button" name="cancel" title="Cancelar" id="Cancel" value="Cancelar" onclick="javascript:window.location=('index.php');" />
				
			</TD>
		</tr>
        </table>
</fieldset>
</form>
<script language="JavaScript" type="text/javascript"> var frmvalidator = new Validator("add");
frmvalidator.addValidation("nombre","req","Nombre del Indicador es requerido");
frmvalidator.addValidation("tema","req","Tema del Indicador es requerido");
frmvalidator.addValidation("concepto","req","Concepto del Indicador es requerido");
frmvalidator.addValidation("objetivo","req","Objetivo del Indicador es requerido");
frmvalidator.addValidation("uso","req","Uso del Indicador es requerido");
frmvalidator.addValidation("definicion_operativa","req","La Definicion Operativa del Indicador es requerido");
frmvalidator.addValidation("unidad_medida","req","La Unidad de Medida del Indicador es requerido");
//frmvalidator.addValidation("variable","dontselect=0","Debe seleccionar por lo menos una variable");
frmvalidator.addValidation("formula","req","La formula para calcular el Indicador es requerido");
frmvalidator.addValidation("id_clasificacion_nivel","dontselect=0","La clasificacion por nivel es requerido");
frmvalidator.addValidation("id_clasificacion_tecnica","dontselect=0","La clasificacion tecnica es requerido");
frmvalidator.addValidation("id_clasificacion_privacidad","dontselect=0","La clasificacion por su provacidad del Indicador es requerido");
frmvalidator.addValidation("id_clasificacion_uso","dontselect=0","La clasificacion por su uso es requerido");
//frmvalidator.addValidation("periodos","dontselect=0","Debe seleccionar por lo menos un periodo");
frmvalidator.addValidation("id_responsable_indicador","dontselect=0","El responsable del indicador es requerido");
//frmvalidator.addValidation("confiabilidad","dontselect=0","La confiabilidad del Indicador es requerido");
//frmvalidator.addValidation("presentacion","dontselect=0","Debe seleccionar por lo menos un tipo de presentacion");

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
</script> <?php
bdd_cerrar($cnx);
}

function general_fillCmbx($table, $field, $id, $cnx){
	$qry ="SELECT ".$field.", ".$id." FROM ".$table." ORDER BY ".$field;
	$result = bdd_pg_query($cnx,$qry);
	while ($row = bdd_pg_fetch_row($result)) {
		echo ('<option value="'.$row[1].'">'.$row[0].'</option>');
	}
}

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

function grabar_nuevo_ficha(){
$cnx = bdd_conectar();
$nombre =(isset($_POST['nombre'])) ? $_POST['nombre'] : "";
$tema =(isset($_POST['tema'])) ? $_POST['tema'] : "";
$concepto =(isset($_POST['concepto'])) ? $_POST['concepto'] : "";
$objetivo =(isset($_POST['objetivo'])) ? $_POST['objetivo'] : "";
$uso =(isset($_POST['uso'])) ? $_POST['uso'] : "";
$definicion_operativa =(isset($_POST['definicion_operativa'])) ? $_POST['definicion_operativa'] : "";
$unidad_medida =(isset($_POST['unidad_medida'])) ? $_POST['unidad_medida'] : "";
$formula =(isset($_POST['formula'])) ? $_POST['formula'] : "";
$id_clasificacion_nivel =(isset($_POST['id_clasificacion_nivel'])) ? $_POST['id_clasificacion_nivel'] : 0;
$id_clasificacion_tecnica =(isset($_POST['id_clasificacion_tecnica'])) ? $_POST['id_clasificacion_tecnica'] : 0;
$id_clasificacion_privacidad =(isset($_POST['id_clasificacion_privacidad'])) ? $_POST['id_clasificacion_privacidad'] : 0;
$id_clasificacion_uso =(isset($_POST['id_clasificacion_uso'])) ? $_POST['id_clasificacion_uso'] : 0;
$id_responsable_indicador =(isset($_POST['id_responsable_indicador'])) ? $_POST['id_responsable_indicador'] : 0;
$confiabilidad =(isset($_POST['confiabilidad'])) ? $_POST['confiabilidad'] : 0;
$observacion =(isset($_POST['observacion'])) ? $_POST['observacion'] : "";
$estandar =(isset($_POST['estandar'])) ? $_POST['estandar'] : 0;
$q = "INSERT INTO ficha_tecnica(
            nombre, tema, concepto, objetivo, uso, definicion_operativa, 
            unidad_medida, formula, id_clasificacion_nivel, id_clasificacion_tecnica, 
            id_clasificacion_privacidad, id_clasificacion_uso, id_responsable_indicador, confiabilidad,
            observacion, estandar)
    VALUES (
  '".$nombre."' , 
  '".$tema."' , 
  '".$concepto."', 
  '".$objetivo."', 
  '".$uso."', 
  '".$definicion_operativa."', 
  '".$unidad_medida."' , 
  '".$formula."' , 
  ".$id_clasificacion_nivel.", 
  ".$id_clasificacion_tecnica.", 
  ".$id_clasificacion_privacidad.", 
  ".$id_clasificacion_uso.", 
  ".$id_responsable_indicador.", 
  ".$confiabilidad.",
 '".$observacion."',
  ".$estandar.")";
	$rs = bdd_pg_query($cnx, $q);
	$af = bdd_pg_affected_rows($rs);
$qid=" SELECT last_value FROM ficha_tecnica_id_ficha_tecnica_seq ";
	$rsid = bdd_pg_query($cnx, $qid);
	$regid = bdd_pg_fetch_row($rsid);
        
$variable =(isset($_POST['variable'])) ? $_POST['variable'] : "xx";
if($variable!='xx'){
    $cant_var=sizeof($variable);
    for ($i=0; $i <= $cant_var; $i ++){
        if($i <= $cant_var-1){
            $q = "INSERT INTO ficha_tecnica_variable(id_ficha_tecnica, id_variable) 
                VALUES (".$regid[0].", ".$variable[$i]." )";
                $rs = bdd_pg_query($cnx, $q);
                $af = bdd_pg_affected_rows($rs);
        }
    }
}
$periodos =(isset($_POST['periodos'])) ? $_POST['periodos'] : "xx";
if($periodos!='xx'){
    $cant_per=sizeof($periodos);
    for ($i=0; $i <= $cant_per; $i ++){
        if($i <= $cant_per-1){
            $q = "INSERT INTO ficha_tecnica_periodicidad(id_ficha_tecnica, id_periodicidad) 
                VALUES (".$regid[0].", ".$periodos[$i].")";
                $rs = bdd_pg_query($cnx, $q);
                $af = bdd_pg_affected_rows($rs);
        }
    }
}
$presentacion =(isset($_POST['presentacion'])) ? $_POST['presentacion'] : "xx";
if($presentacion!='xx'){
    $cant_pre=sizeof($presentacion);
    for ($i=0; $i <= $cant_pre; $i ++){
        if($i <= $cant_pre-1){
            $q = "INSERT INTO ficha_tecnica_presentacion(id_ficha_tecnica, id_presentacion) 
                VALUES (".$regid[0].", ".$presentacion[$i].")";
                $rs = bdd_pg_query($cnx, $q);
                $af = bdd_pg_affected_rows($rs);
        }
    }
}
        if ($af){ 
		?>
		<p class="ok">Registro modificado!</p>
		<p > Regresar a <a href="/indicadores/formula/ficha/">Ficha Tecnica</a></p>
		<?php
	} else { 
		?>
		<p class="error">El registro no ha sufrido modificacion<br />
		<p > Regresar a <a href="/indicadores/formula/ficha/">Ficha Tecnica</a></p>
		<?php echo pg_error($cnx);?></p>
		<?php
	}
	bdd_cerrar($cnx);
}

function listarTodos($table, $data, $url , $fields = '*', $per_page = 20) {
	$cnx = bdd_conectar();
	$actions = "Acciones";
	$aAdd = "Activar";
	$aEdit = "Bloquear";
	$aDelete = "Asignar";
	$q = 'SELECT '.$fields.' FROM '.$table.' order by id_ficha_tecnica';
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
					case 'id_ficha_tecnica':
						$fname = "ID";
					break;
					case 'tema':
						$fname = "Tema";
					break;
					case 'concepto':
						$fname = "Concepto";
					break;
					case 'nombre':
						$fname = "Nombre del Indicador";
					break;
					case 'objetivo':
						$fname = "Objetivo";
					break;

					case 'uso':
						$fname = "Uso";
					break;
                                    	case 'definicion_operativa':
						$fname = "Definicion Operativa";
					break;
                                        case 'formula':
						$fname = "Formula";
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
						case 7:
							?>
      							<td><?php 
							echo("<div style=\"font-family : 'Times New Roman',times,serif ; font-size :{60}pt;\">".mathfilter("<m>".$reg[$i]."</m>",15,"../../addons/phpmathpublisher/img/")."</div>");  ?> 
                                                        </td>
      							<?php
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
					}else{ ?>
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

function editar_ficha($id){
	$cnx = bdd_conectar();
	$q = '	SELECT id_ficha_tecnica, nombre, tema, concepto, objetivo, uso, definicion_operativa, 
        unidad_medida, formula, id_clasificacion_nivel, id_clasificacion_tecnica, 
        id_clasificacion_privacidad, id_clasificacion_uso, id_responsable_indicador, 
        observacion, confiabilidad, estandar
        FROM ficha_tecnica where id_ficha_tecnica='.$id;
	$rs = bdd_pg_query($cnx, $q);
	if ($rs) { 
		$reg = bdd_pg_fetch_row($rs)
		?>
		<h3>Editar Una Ficha Tecnica de Indicador</h3>
		<form action="<?php echo $_SERVER['PHP_SELF']?>?action=guardar" method="POST" id="edit" name="edit" >
			<fieldset ><legend> Editar una Ficha Tecnica de Indicador </legend>
 	<table width="100%" align="center">
		<TR class="frm-fld-x-odd">
			<TD width="20%">Nombre del Indicador</TD>
			<TD width="80%">
				<input type='text' tabindex="1" name="nombre" id="nombre" maxlength="100" size="100" value="<?php echo $reg[1]; ?>"/>
                        </TD>
		</TR>
		<TR class="frm-fld-x">
			<TD width="20%">Tema del Indicador</TD>
			<TD width="80%">
				<textarea tabindex="2" name="tema" id="tema" rows="3" cols="80"><?php echo $reg[2]; ?></textarea>
			</TD>
		</TR>
		<TR class="frm-fld-x-odd">
			<TD width="20%">Concepto del Indicador</TD>
			<TD>
				<textarea tabindex="3" name="concepto" id="concepto" rows="3" cols="80"><?php echo $reg[3]; ?></textarea>
			</TD>
		</TR>
		<TR class="frm-fld-x">
			<TD width="20%">Objetivo del Indicador</TD>
			<TD width="80%">
				<textarea tabindex="4" name="objetivo" id="objetivo" rows="3" cols="80"><?php echo $reg[4]; ?></textarea>
			</TD>
		</TR>
		<TR class="frm-fld-x-odd">
			<TD width="20%">Uso del Indicador</TD>
			<TD width="80%">
				<textarea tabindex="5" name="uso" id="uso" rows="3" cols="80"><?php echo $reg[5]; ?></textarea>
			</TD>
		</TR>
		<TR class="frm-fld-x">
			<TD width="20%">Definicion Operativa del Indicador</TD>
			<TD width="80%">
      				<textarea tabindex="6" name="definicion_operativa" id="definicion_operativa" rows="3" cols="80"><?php echo $reg[6]; ?></textarea>
                        </TD>
		</TR>
		<TR class="frm-fld-x-odd">
			<TD width="20%">Unidad de Medida del Indicador</TD>
			<TD width="80%">
				<input type="text" tabindex="7" name="unidad_medida" id="unidad_medida"  size="50" maxlength="50"  value="<?php echo $reg[7]; ?>"/>
                        </TD>
		</TR>
               <TR class="frm-fld-x">
			<TD width="20%">Variables
			</TD>
                        <TD><P><font color="#B45F04">Disponibles</font> </P>
				<select name="variable1" size="5" id="variable1" >
					<?php general_fillCmbxxx('SELECT nombre , id_variable FROM variable_dato where id_variable not in ( SELECT  id_variable
                                        FROM ficha_tecnica_variable where id_ficha_tecnica= '.$id.')', $cnx); ?>
				</select>
				<div ><P><font color='#990000'>Acciones: </font><input type="button" title="Pasar de la lista Disponible a Seleccionado" value="\/" onclick="cambiar(1); botones();">
				<input type="button" value="/\" title="Pasar de la lista Seleccionado a Disponible" onclick="document.getElementById('formula').value=''; cambiar(0); botones(); "></P></div>
                            <P><font color="#B45F04">  Seleccionados</font></P>
				<select name="variable[]" size="5" id="variable" multiple="true" onblur="seleccionar(this);" >
					<?php general_fillCmbxx(' public.ficha_tecnica_variable, public.variable_dato ', ' variable_dato.nombre ', 'variable_dato.id_variable',
                                        ' variable_dato.id_variable = ficha_tecnica_variable.id_variable and  ficha_tecnica_variable.id_ficha_tecnica='.$id ,$cnx); ?>
                                </select>
			</TD>
                </TR>
                <TR class="frm-fld-x-odd">
		      <TD width="20%">Formula</TD>
		      <TD width="80%">
                            <div id="resultado1"> <?php
                            $q1="SELECT variable_dato.nombre, variable_dato.iniciales FROM public.ficha_tecnica_variable, public.variable_dato
                                WHERE ficha_tecnica_variable.id_variable = variable_dato.id_variable AND  ficha_tecnica_variable.id_ficha_tecnica=".$id;
                                  $rs1 = bdd_pg_query($cnx, $q1);
                             $boton='';
                             while ($reg1 = bdd_pg_fetch_row($rs1)){
                                 $boton=$boton.','.$reg1[1];
                                    echo "<input  class='frm-btn-x' type='button' name='cancel' title='".$reg1[1]."' id='Cancel' value='".$reg1[1]."' onclick='nvar(this)'  />";
                                    echo "<font size=2 color='#006600'> = ".$reg1[0]."</font> <br />";
                            }?>
                            <input type="hidden" name="boton" id="boton" value="<?php echo $boton; ?>" />
                            </div><div>
                                <input type="hidden" name="posicion" id="posicion" value="0" />
                                <input  class='frm-btn-x' type='button' name='sumar' title='Sumar' id='sumar' value='+'  onclick='sumar()' />
                                <input  class='frm-btn-x' type='button' name='cancel' title='Sustraer' id='Cancel' value='-' onclick='restar()' />
                                <input  class='frm-btn-x' type='button' name='cancel' title='Multiplicar' id='Cancel' value='x' onclick='multiplicar()'/>
                                <input  class='frm-btn-x' type='button' name='cancel' title='Dividir' id='Cancel' value='/' onclick='dividir()'/>
                                <input  class='frm-btn-x' type='button' name='cancel' title='Abrir Parentesis(agrupacion visible)' id='Cancel' value='(' onclick='abrirv()'/>
                                <input  class='frm-btn-x' type='button' name='cancel' title='Cerrar Parentesis(agrupacion visible)' id='Cancel' value=')' onclick='cerrarv()'/>
                                <input  class='frm-btn-x' type='button' name='cancel' title='Abrir Parentesis(agrupacion invisible)' id='Cancel' value='{' onclick='abriri()'/>
                                <input  class='frm-btn-x' type='button' name='cancel' title='Cerrar Parentesis(agrupacion invisible)' id='Cancel' value='}' onclick='cerrari()'/>
                                <input  class='frm-btn-x' type='button' name='cancel' title='Exponencial' id='Cancel' value='^'  onclick='exponencial()'/>
                                <input  class='frm-btn-x' type='button' name='cancel' title='Raiz Cuadrada' id='Cancel' value='<?php echo '&#8730;'; ?>' onclick='raiz()' />
                                <input  class='frm-btn-x' type='button' name='cancel' title='Diez' id='Cancel' value='10' onclick='diez()'/>
                                <input  class='frm-btn-x' type='button' name='cancel' title='Cien' id='Cancel' value='100'  onclick='cien()'/>
                                <input  class='frm-btn-x' type='button' name='cancel' title='Un Mil' id='Cancel' value='1000' onclick='mil()' />
                            </div>
                            <div> 
                                <input  class='frm-btn-x' type='button' name='cancel1' title='Limpiar Formula' id='limpiar' value='Borrar formula'  onclick='limpiar1()' />
                            </div>
                            <textarea tabindex="8" name="formula" id="formula" rows="3" cols="80"  onblur="posicionCursor(); compararps(); " ><?php echo $reg[8]; ?></textarea> 
                            <div id="resultado"><?php 
                                echo("<div style=\"font-family : 'Times New Roman',times,serif ; font-size :{60}pt;\">".mathfilter("<m>".$reg[8]."</m>",15,"../../addons/phpmathpublisher/img/")."</div>");  ?> 
                            </div>
                            <input class='frm-btn-x' type='button' name='cancel1' title='Comprobar sintaxis de formula' id='verificar' value='Comprobar sintaxis de formula'  onclick='calcular()' />
                            <div id="resultado2"></div>
                      </TD>
		</TR>
 
		<TR class="frm-fld-x">
			<TD width="20%">Clasificacion por Nivel de Uso</TD>
			<TD width="80%">
				<select name="id_clasificacion_nivel" tabindex="9" size="1" id="id_clasificacion_nivel">
					<option selected="selected"> [Seleccione Uno ..]</option>
					<?php general_fillCmb('clasificacion_nivel', 'id_clasificacion_nivel', 'id_clasificacion_nivel', 'descripcion', $reg[9], NULL, $cnx); ?>
				</select>
			</TD>
		</TR>
		<TR class="frm-fld-x-odd">
			<TD width="20%">Clasificacion Tecnica</TD>
			<TD width="80%">
				<select name="id_clasificacion_tecnica" tabindex="10" size="1" id="id_clasificacion_tecnica">
					<option selected="selected"> [Seleccione Uno ..]</option>
					<?php general_fillCmb('clasificacion_tecnica', 'id_clasificacion_tecnica', 'id_clasificacion_tecnica', 'descripcion', $reg[10], NULL, $cnx); ?>
				</select>
			</TD>
		</TR>
		<TR class="frm-fld-x">
			<TD width="20%">Clasificacion segun su Privacidad</TD>
			<TD width="80%">
				<select name="id_clasificacion_privacidad" tabindex="11" size="1" id="id_clasificacion_privacidad">
					<option selected="selected"> [Seleccione Uno ..]</option>
					<?php general_fillCmb('clasificacion_privacidad', 'id_clasificacion_privacidad', 'id_clasificacion_privacidad', 'descripcion', $reg[11], NULL, $cnx); ?>
				</select>
			</TD>
		</TR>
		<TR class="frm-fld-x-odd">
			<TD width="20%">Clasificacion Por su Uso</TD>
			<TD width="80%">
				<select name="id_clasificacion_uso" tabindex="12" size="1" id="id_clasificacion_uso">
					<option selected="selected"> [Seleccione Uno ..]</option>
					<?php general_fillCmb('clasificacion_uso', 'id_clasificacion_uso', 'id_clasificacion_uso', 'descripcion', $reg[12], NULL, $cnx); ?>
				</select>
			</TD>
		</TR>
                <TR class="frm-fld-x">
			<TD width="20%">Periodicidad
			</TD>
			<TD><P>Disponibles ---------------------> Seleccionados</P>
				<select name="periodo1" size="5" id="periodo1">
					<?php general_fillCmbxxx('SELECT cat_periodo_indicador.descripcion, cat_periodo_indicador.id_periodo_indicador
                                        FROM public.cat_periodo_indicador where cat_periodo_indicador.id_periodo_indicador not in (SELECT ficha_tecnica_periodicidad.id_periodicidad
                                        FROM public.ficha_tecnica_periodicidad, public.cat_periodo_indicador WHERE cat_periodo_indicador.id_periodo_indicador = ficha_tecnica_periodicidad.id_periodicidad
                                        and ficha_tecnica_periodicidad.id_ficha_tecnica  = '.$id.')', $cnx); ?>
				</select>
				<input type="button" value="->" onclick="cambiar1(1)">
				<input type="button" value="<-" onclick="cambiar1(0)">
				<select name="periodos[]" size="5" id="periodos" onblur="seleccionar(this);" multiple="true">
					<?php general_fillCmbxx(' public.ficha_tecnica_periodicidad, public.cat_periodo_indicador ', ' cat_periodo_indicador.descripcion ', 
                                        ' ficha_tecnica_periodicidad.id_periodicidad ',' cat_periodo_indicador.id_periodo_indicador = ficha_tecnica_periodicidad.id_periodicidad
                                        and  ficha_tecnica_periodicidad.id_ficha_tecnica='.$id ,$cnx); ?>
                                </select>
			</TD>
                </TR>
                <TR class="frm-fld-x-odd">
			<TD width="20%">Responsable del Indicador</TD>
			<TD width="80%">
				<select name="id_responsable_indicador" tabindex="13" size="1" id="id_responsable_indicador">
					<option selected="selected"> [Seleccione Uno ..]</option>
					<?php general_fillCmb('responsable_indicador', 'id_responsable_indicador', 'id_responsable_indicador', 'nombre', $reg[13], NULL, $cnx); ?>
				</select>
			</TD>
		</TR>
		<TR class="frm-fld-x">
			<TD width="20%">Confiabilidad del Indicador (%)</TD>
			<TD width="80%">
                           <body class="yui-skin-sam">
                               <div id="slider-bg" class="yui-h-slider" tabindex="-1" title="Confiabilidad">
                                    <div id="slider-thumb" class="yui-slider-thumb"><img src="../../addons/yui1/examples/slider/assets/thumb-n.gif"></div>
                               </div>
                               <span id="slider-value"></span>
                               <input  align="right" autocomplete="off" name="confiabilidad" id="confiabiliada" type="text" size="3" maxlength="3" onkeypress='validate(event)' value="<?php echo $reg[15]; ?>"/>%
                           </body>
                        </TD>
		</TR>
                <TR class="frm-fld-x-odd">
			<TD width="20%">Estandar Nacional</TD>
			<TD width="80%">
      				<input  align="right" autocomplete="off" name="estandar" id="estandar" type="text" value="<?php echo $reg[16]; ?>" size="11" maxlength="11" onkeypress='validate(event)'/>%
                        </TD>
		</TR>

		<TR class="frm-fld-x-odd">
			<TD width="20%">Observacion</TD>
			<TD width="80%">
      				<textarea tabindex="15" name="observacion" id="observacion" rows="3" cols="80"><?php echo $reg[14]; ?></textarea>
                        </TD>
		</TR>
                <TR class="frm-fld-x">
			<TD width="20%">Presentacion
			</TD>
			<TD><P>Disponibles ---------------------> Seleccionados</P>
				<select name="presentacion1" size="5" id="presentacion1">
					<?php general_fillCmbxxx('SELECT  cat_presentacion.descripcion, cat_presentacion.id_presentacion
                                        FROM public.cat_presentacion  where cat_presentacion.id_presentacion not in (SELECT ficha_tecnica_presentacion.id_presentacion
                                        FROM public.cat_presentacion, public.ficha_tecnica_presentacion WHERE cat_presentacion.id_presentacion = ficha_tecnica_presentacion.id_presentacion
                                        and ficha_tecnica_presentacion.id_ficha_tecnica= '.$id.')', $cnx); ?>
				</select>
				<input type="button" value="->" onclick="cambiar2(1)">
				<input type="button" value="<-" onclick="cambiar2(0)" >
				<select name="presentacion[]" size="5" id="presentacion" onblur="seleccionar(this);" multiple="true">
					<?php general_fillCmbxx(' public.cat_presentacion, public.ficha_tecnica_presentacion ', ' cat_presentacion.descripcion ', 
                                        ' ficha_tecnica_presentacion.id_presentacion ',' cat_presentacion.id_presentacion = ficha_tecnica_presentacion.id_presentacion
                                        and ficha_tecnica_presentacion.id_ficha_tecnica='.$id ,$cnx); ?>
                                </select>
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
                                        <input tabindex="10" class="frm-btn-x" type="button" name="cancel3" title="Imprimir ficha tecnica" id="Cancel3" value="Imprimir Ficha Tecnica" onclick="javascript:ImprimirPDF(<?php echo $id; ?>);" /><br/><br/>
                                        <div id="salidaPDF"></div>
                                    </TD>
				</tr>
                            </table>
                    </fieldset>
		</form>
		<script language="JavaScript" type="text/javascript"> var frmvalidator = new Validator("edit"); 
                    frmvalidator.addValidation("nombre","req","Nombre del Indicador es requerido");
                    frmvalidator.addValidation("tema","req","Tema del Indicador es requerido");
                    frmvalidator.addValidation("concepto","req","Concepto del Indicador es requerido");
                    frmvalidator.addValidation("objetivo","req","Objetivo del Indicador es requerido");
                    frmvalidator.addValidation("uso","req","Uso del Indicador es requerido");
                    frmvalidator.addValidation("definicion_operativa","req","La Definicion Operativa del Indicador es requerido");
                    frmvalidator.addValidation("unidad_medida","req","La Unidad de Medida del Indicador es requerido");
                    //frmvalidator.addValidation("variable[]","dontselect=0","Debe seleccionar por lo menos una variable");
                    frmvalidator.addValidation("formula","req","La formula para calcular el Indicador es requerido");
                    frmvalidator.addValidation("id_clasificacion_nivel","dontselect=0","La clasificacion por nivel es requerido");
                    frmvalidator.addValidation("id_clasificacion_tecnica","dontselect=0","La clasificacion tecnica es requerido");
                    frmvalidator.addValidation("id_clasificacion_privacidad","dontselect=0","La clasificacion por su provacidad del Indicador es requerido");
                    frmvalidator.addValidation("id_clasificacion_uso","dontselect=0","La clasificacion por su uso es requerido");
                //    frmvalidator.addValidation("periodos","dontselect=0","Debe seleccionar por lo menos un periodo");
                    frmvalidator.addValidation("id_responsable_indicador","dontselect=0","El responsable del indicador es requerido");
                 //   frmvalidator.addValidation("confiabilidad","dontselect=0","La confiabilidad del Indicador es requerido");
                //    frmvalidator.addValidation("presentacion","dontselect=0","Debe seleccionar por lo menos un tipo de presentacion");

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
                    
		</script>
		<?php 
	} else { ?>
		<p class="error">Id no encontrado</p>
		<?php 
	}
	bdd_cerrar($cnx);
}

function actualizar_ficha($id){
	$cnx = bdd_conectar();
        $nombre =(isset($_POST['nombre'])) ? $_POST['nombre'] : "";
        $tema =(isset($_POST['tema'])) ? $_POST['tema'] : "";
        $concepto =(isset($_POST['concepto'])) ? $_POST['concepto'] : "";
        $objetivo =(isset($_POST['objetivo'])) ? $_POST['objetivo'] : "";
        $uso =(isset($_POST['uso'])) ? $_POST['uso'] : "";
        $definicion_operativa =(isset($_POST['definicion_operativa'])) ? $_POST['definicion_operativa'] : "";
        $unidad_medida =(isset($_POST['unidad_medida'])) ? $_POST['unidad_medida'] : "";
        $formula =(isset($_POST['formula'])) ? $_POST['formula'] : "";
        $id_clasificacion_nivel =(isset($_POST['id_clasificacion_nivel'])) ? $_POST['id_clasificacion_nivel'] : 0;
        $id_clasificacion_tecnica =(isset($_POST['id_clasificacion_tecnica'])) ? $_POST['id_clasificacion_tecnica'] : 0;
        $id_clasificacion_privacidad =(isset($_POST['id_clasificacion_privacidad'])) ? $_POST['id_clasificacion_privacidad'] : 0;
        $id_clasificacion_uso =(isset($_POST['id_clasificacion_uso'])) ? $_POST['id_clasificacion_uso'] : 0;
        $id_responsable_indicador =(isset($_POST['id_responsable_indicador'])) ? $_POST['id_responsable_indicador'] : 0;
        $confiabilidad =(isset($_POST['confiabilidad'])) ? $_POST['confiabilidad'] : 0;
        $estandar =(isset($_POST['estandar'])) ? $_POST['estandar'] : 0;
        $observacion =(isset($_POST['observacion'])) ? $_POST['observacion'] : "";
	$q = "UPDATE ficha_tecnica SET
			nombre= 	'".$nombre."'
		,	tema=           '".$tema."'
		,	concepto= 	'".$concepto."'
		,	objetivo= 	'".$objetivo."'
		,	uso=            '".$uso."'
		,	definicion_operativa= 	'".$definicion_operativa."'
		,	unidad_medida= '".$unidad_medida."'
		,	formula= 	'".$formula."'
		,	id_clasificacion_nivel= 	".$id_clasificacion_nivel."
		,	id_clasificacion_tecnica= ".$id_clasificacion_tecnica."
		,	id_clasificacion_privacidad= 	".$id_clasificacion_privacidad."
		,	id_clasificacion_uso= ".$id_clasificacion_uso."
		,	id_responsable_indicador= 	".$id_responsable_indicador."
		,	confiabilidad= 	".$confiabilidad."
                ,	estandar= 	".$estandar."
		,	observacion= '".$observacion."'
            where 	id_ficha_tecnica=".$id;
        $rs = bdd_pg_query($cnx, $q);
	$af = bdd_pg_affected_rows($rs);
       $q = " DELETE FROM ficha_tecnica_variable WHERE id_ficha_tecnica =".$id;
		$rs = bdd_pg_query($cnx, $q);
		$num = bdd_pg_num_rows($rs); 
        $variable =(isset($_POST['variable'])) ? $_POST['variable'] : "xx";
        if($variable!='xx'){
            $cant_var=sizeof($variable);
            for ($i=0; $i <= $cant_var; $i ++){
                if($i <= $cant_var-1){
                    $q = "INSERT INTO ficha_tecnica_variable(id_ficha_tecnica, id_variable) 
                        VALUES (".$id.", ".$variable[$i]." )";
                        $rs = bdd_pg_query($cnx, $q);
                        $af = bdd_pg_affected_rows($rs);
                }
            }
        }
        
       $q = " DELETE FROM ficha_tecnica_periodicidad WHERE id_ficha_tecnica =".$id;
		$rs = bdd_pg_query($cnx, $q);
		$num = bdd_pg_num_rows($rs); 
        
        $periodos =(isset($_POST['periodos'])) ? $_POST['periodos'] : "xx";
        if($periodos!='xx'){
            $cant_per=sizeof($periodos);
            for ($i=0; $i <= $cant_per; $i ++){
                if($i <= $cant_per-1){
                    $q = "INSERT INTO ficha_tecnica_periodicidad(id_ficha_tecnica, id_periodicidad) 
                        VALUES (".$id.", ".$periodos[$i].")";
                        $rs = bdd_pg_query($cnx, $q);
                        $af = bdd_pg_affected_rows($rs);
                }
            }
        }
        $q = " DELETE FROM ficha_tecnica_presentacion WHERE id_ficha_tecnica =".$id;
		$rs = bdd_pg_query($cnx, $q);
		$num = bdd_pg_num_rows($rs); 
        $presentacion =(isset($_POST['presentacion'])) ? $_POST['presentacion'] : "xx";
        if($presentacion!='xx'){
            $cant_pre=sizeof($presentacion);
            for ($i=0; $i <= $cant_pre; $i ++){
                if($i <= $cant_pre-1){
                    $q = "INSERT INTO ficha_tecnica_presentacion(id_ficha_tecnica, id_presentacion) 
                        VALUES (".$id.", ".$presentacion[$i].")";
                        $rs = bdd_pg_query($cnx, $q);
                        $af = bdd_pg_affected_rows($rs);
                }
            }
        }        
        
        if ($af){ 
		?>
		<p class="ok">Registro modificado!</p>
		<p > Regresar a <a href="/indicadores/formula/ficha/">Ficha Tecnica</a></p>
		<?php
	} else { 
		?>
		<p class="error">El registro no ha sufrido modificacion<br />
		<p > Regresar a <a href="/indicadores/formula/ficha/">Ficha Tecnica</a></p>
		  <?php echo mysqli_error($cnx);?></p>
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

function imprimir($id){
    	require_once("../../addons/fpdf/table/class.fpdf_table.php");
	require_once("encabezado_pie.inc");
	require_once("table_def.inc");
	include_once("../../addons/general/general.php");
        include_once("../../addons/phpmathpublisher/mathpublisher.php") ;
        include_once("ficha.php");
        $q="SELECT
          ficha_tecnica.nombre,
          ficha_tecnica.tema,
          ficha_tecnica.concepto,
          ficha_tecnica.objetivo,
          ficha_tecnica.uso,
          ficha_tecnica.definicion_operativa,
          ficha_tecnica.unidad_medida,
          clasificacion_nivel.descripcion,
          clasificacion_tecnica.descripcion,
          clasificacion_privacidad.descripcion,
          clasificacion_uso.descripcion,
          responsable_indicador.nombre,
          ficha_tecnica.observacion,
          ficha_tecnica.confiabilidad,
          ficha_tecnica.formula
        FROM
          public.ficha_tecnica,
          public.clasificacion_nivel,
          public.clasificacion_privacidad,
          public.clasificacion_tecnica,
          public.clasificacion_uso,
          public.responsable_indicador
        WHERE
          ficha_tecnica.id_responsable_indicador = responsable_indicador.id_responsable_indicador AND
          ficha_tecnica.id_clasificacion_uso = clasificacion_uso.id_clasificacion_uso AND
          clasificacion_nivel.id_clasificacion_nivel = ficha_tecnica.id_clasificacion_nivel AND
          clasificacion_privacidad.id_clasificacion_privacidad = ficha_tecnica.id_clasificacion_privacidad AND
          clasificacion_tecnica.id_clasificacion_tecnica = ficha_tecnica.id_clasificacion_tecnica and id_ficha_tecnica=".$id;
        $cnx = bdd_conectar();
        $rs = bdd_pg_query($cnx, $q);
	$reg = bdd_pg_fetch_row($rs);
        $formula=$reg[14];
	$bg_color1 = array(234, 255, 218);
	$bg_color2 = array(165, 250, 220);
	$bg_color3 = array(255, 252, 249);	
	$pdf = new pdf_usage();		
	$pdf->Open();
	$pdf->SetAutoPageBreak(true, 20);
        $pdf->SetMargins(15, 20, 20);
	$pdf->AddPage();
	$pdf->AliasNbPages(); 
	$columns = 2; 
	$pdf->SetStyle("p","times","",10,"130,0,30");
	$pdf->SetStyle("t1","arial","",10,"0,151,200");
	$pdf->SetStyle("size","times","BI",13,"0,0,120");
	$pdf->tbInitialize($columns, true, true);
	$pdf->tbSetTableType($table_default_table_type);
	for($i=0; $i<$columns; $i++) $header_type[$i] = $table_default_header_type;
	for($i=0; $i<$columns; $i++) {
		$header_type1[$i] = $table_default_header_type;
		$header_type2[$i] = $table_default_header_type;
		$header_type2[$i]['T_COLOR'] = array(10,20, 100);
		$header_type2[$i]['BG_COLOR'] = $bg_color1;
	}
	$header_type1[0]['WIDTH'] = 40;
	$header_type1[1]['WIDTH'] = 130;
        $header_type1[0]['T_ALIGN'] = "L";
        $header_type1[1]['T_ALIGN'] = "L";
	$header_type1[0]['TEXT'] = "Nombre del Indicador";
	$header_type1[1]['TEXT'] = "$reg[0]";
	$aHeaderArray = array(
		$header_type1
	);	
	$pdf->tbSetHeaderType($aHeaderArray, true);
	$pdf->tbDrawHeader();
	$data_type = Array();//reset the array
	for ($i=0; $i<$columns; $i++) $data_type[$i] = $table_default_data_type;
	$pdf->tbSetDataType($data_type);
	$fsize = 5;
	$colspan = 2;
	$rowspan = 2;
	$rgb_r = 255;
	$rgb_g = 255;
	$rgb_b = 255;
        $fijo=array(
            'Tema',
            'Concepto',
            'Objetivo',
            'Uso',
            'Definicion',
            'Unidad de Medida',
            'Clasificacion por su nivel de uso',
            'Clasificacion Tecnica',
            'Clasificacion por su provacidad',
            'Otra Clasificacion',
            'Responsable',
            'Obseervacion',
            'Fiabilidad',
            'Formula'
        );
        $i=1;
        $data = Array();
        $data[0]['BG_COLOR'] = array(236, 230, 230);
        $data[0]['T_ALIGN'] = "L";
        $data[1]['T_ALIGN'] = "L";      
        for ($j=0; $j<14; $j++){
		$data[0]['TEXT'] = " $fijo[$j]";
                $data[1]['TEXT'] = "$reg[$i]";
                $pdf->tbDrawData($data);
                $i++;
	}
	$pdf->tbDrawBorder();	
 
 ////******
              $q="SELECT DISTINCT ON (variable_dato.nombre) 
              variable_dato.nombre,
              variable_dato.iniciales,
              fuente_dato.nombre,
              fuente_dato.contacto,
              fuente_dato.correo,
              fuente_dato.telefono,
              fuente_dato.cargo,
              responsable_dato.nombre,
              responsable_dato.contacto,
              responsable_dato.correo,
              responsable_dato.telefono,
              responsable_dato.cargo,
              variable_dato.confiabilidad,
              variable_dato.comentario
            FROM public.ficha_tecnica_variable, public.variable_dato, public.responsable_dato,
              public.fuente_dato, public.sentencia, public.conexion
            WHERE ficha_tecnica_variable.id_variable = variable_dato.id_variable AND
              responsable_dato.id_responsable_dato = variable_dato.id_responsable AND
              fuente_dato.id_fuente_dato = variable_dato.id_fuente AND
              sentencia.id_sentencia = variable_dato.id_sentencia and
              ficha_tecnica_variable.id_ficha_tecnica=".$id;
        $rs = bdd_pg_query($cnx, $q);
        $data_type = Array();
        while ($reg = bdd_pg_fetch_row($rs)) {
            for ($i=0; $i<$columns; $i++) $data_type[$i] = $table_default_data_type;
            $fsize = 5;
            $colspan = 2;
            $rowspan = 2;
            $rgb_r = 255;
            $rgb_g = 255;
            $rgb_b = 255;
            $fijo=array(
                'Nombre de la Variable',
                'Iniciales de la Variable',
                'Nombre de la Fuente de Datos',
                'Contacto en la Fuente de Datos',
                'Correo electronico',
                'Telefonono',
                'Cargo',
                'Nombre del Responsable del Datos',
                'Contacto Responsable del Datos',
                'Correo electronico',
                'Telefonono',
                'Cargo',
                'Fiabilidad del la Variable (%)',
                'Comentario'
             );
            $i=0;
            $data = Array();
            $data[0]['BG_COLOR'] = array(236, 230, 230);
            $data[0]['T_ALIGN'] = "L";
            $data[1]['T_ALIGN'] = "L";
            for ($j=0; $j<14; $j++){
                if ($j==0){
			$data[0]['BG_COLOR'] = array(106, 206, 236);
                        $data[1]['BG_COLOR'] = array(106, 206, 236);
                }else{
                        $data[0]['BG_COLOR'] = array(236, 230, 230);
                        $data[1]['BG_COLOR'] = array(255,255,255);
                }
                    $data[0]['TEXT'] = " $fijo[$j]";
                    $data[1]['TEXT'] = "$reg[$i]";
                    $pdf->tbDrawData($data);
                    $i++;
            }
        }
        $size=15;
      //  $nameimg ='math_980_'. md5(trim($formula).$size).'.png';
       // $pdf->Image("../../addons/phpmathpublisher/img/".$nameimg,100,265,30);
	$pdf->tbOuputData();
      	$pdf->tbDrawBorder();
        $pdf->Output("ficha.pdf","F");
}
?>