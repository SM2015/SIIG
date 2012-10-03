<?php
function buscar(){ ?>
<script type="text/javascript" src="ajax1.js"></script>
<form method="POST" action="conf_indicador">
    <?php $cnx=bdd_conectar(); ?>
<table align="center" width="100%">
    <TR class="frm-fld-x">
           <TD width="10%">Nombre del Indicador</TD>
            <TD width="40%">
                <select name="nombre" tabindex="1" size="1" id="nombre">
                        <option selected="selected"> [Seleccione Uno ..]</option>
                        <?php general_fillCmbS("SELECT id_ficha_tecnica, nombre  FROM ficha_tecnica order by nombre", $cnx); ?>
                </select>
            </TD>
            <TD width="10%">Tema del Indicador</TD>
            <TD width="40%">
                    <select name="tema" size="1" id="tema">
                            <option selected="selected"> [Seleccione Uno ..]</option>
                            <?php general_fillCmbS("SELECT tema, tema  FROM ficha_tecnica order by tema", $cnx); ?>
                    </select>
            </TD>
    </TR>
     <TR class="frm-fld-x-odd">
            <TD width="10%">Clasificacion por Nivel</TD>
            <TD width="40%">
                    <select name="cnivel" size="1" id="cnivel">
                            <option selected="selected"> [Seleccione Uno ..]</option>
                            <?php general_fillCmbS("SELECT id_clasificacion_nivel, descripcion FROM clasificacion_nivel order by descripcion", $cnx); ?>
                    </select>
            </TD>
             <TD width="10%">Clasificacion Tecnica</TD>
            <TD width="40%">
                    <select name="ctecnica" size="1" id="ctecnica">
                            <option selected="selected"> [Seleccione Uno ..]</option>
                            <?php general_fillCmbS("SELECT id_clasificacion_tecnica, descripcion FROM clasificacion_tecnica order by descripcion", $cnx); ?>
                    </select>
            </TD>
    </TR>
    <TR class="frm-fld-x">
            <TD width="10%">Clasificacion Por Uso</TD>
            <TD width="40%">
                    <select name="cuso" size="1" id="cuso">
                            <option selected="selected"> [Seleccione Uno ..]</option>
                            <?php general_fillCmbS("SELECT id_clasificacion_uso, descripcion FROM clasificacion_uso order by descripcion", $cnx); ?>
                    </select>
            </TD>
            <TD width="10%">Responsable del Indicador</TD>
            <TD width="40%">
                    <select name="responsable" size="1" id="responsable">
                            <option selected="selected"> [Seleccione Uno ..]</option>
                            <?php general_fillCmbS("SELECT id_responsable_indicador, nombre FROM responsable_indicador order by nombre", $cnx); ?>
                    </select>
            </TD>
    </TR>
</table>
    <div align="center" class="frm-fld-x-odd"><input  class="frm-btn-x" type="button" name="filtrar" title="Filtrar lo seleccionado" id="filtrar" value="Filtrar" onclick="hola();" /> </div>
<input type="hidden" name="datos" id="datos" />
<input type="hidden" name="action" value="filtrar" />
    <div align="center"  class="frm-fld-x"><input  class="frm-btn-x" disabled="false" type="button" name="graficar" title="Configurar los indicadores seleccionados" id="graficar" value="Configurar Presentacion del Indicador" onclick="irpanel();" /> </div>
</form>
<div id="resultado">
    <?php
    $data = array('Marcar');
    $urls = array('Marcar');
    echo listarTodos('ficha_tecnica', $data, $urls, 'id_ficha_tecnica, nombre, id_clasificacion_nivel, id_clasificacion_tecnica,id_clasificacion_uso, id_responsable_indicador'); ?>
</div><?php
}

function general_fillCmbS($qry, $cnx){
	$result = bdd_pg_query($cnx,$qry);
	while ($row = bdd_pg_fetch_row($result)) {
		if ($row[0]==$selected) {
			echo ('<option value="'.$row[0].'" selected>'.$row[1].'-'.$row[2].'-'.$row[3].'-'.$row[4].'</option>');
		} else {
			echo ('<option value="'.$row[0].'">'.$row[1].' - '.$row[2].' - '.$row[3].' - '.$row[4].'</option>');
		}
	}
}

function listarTodos($table, $data, $url , $fields = '*', $per_page = 50) {
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
		$q1=$q." LIMIT 50";
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
					case 'nombre':
						$fname = "Nombre del Indicador";
					break;
					case 'id_clasificacion_nivel':
						$fname = "Clasificacion por Nivel";
					break;
					case 'id_clasificacion_tecnica':
						$fname = "Clasificacion Tecnica";
					break;
					case 'id_clasificacion_uso':
						$fname = "Clasificacion Por Uso";
					break;

					case 'id_responsable_indicador':
						$fname = "Responsable del Indicador";
					break;
				}
				?>
				<th rowspan="2"><?php echo $fname; ?></th>
      				<?php
				$i++;
			} 
			echo (count($data)>0)? "<th colspan=\"".count($data)."\" >".$actions."</th>" : NULL; ?> </tr>
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
                                            case 2: ?>
                                                        <td><?php
							$idx = $reg[$i];
							$datosmotor = general_sacarRegistroPorCondicion('clasificacion_nivel', 'id_clasificacion_nivel = '.$idx, $cnx, 'descripcion');
							echo $datosmotor[0];
							?></td><?php
                                            break;
                                            case 3: ?>
                                                        <td><?php
							$idx = $reg[$i];
							$datosmotor = general_sacarRegistroPorCondicion('clasificacion_tecnica', 'id_clasificacion_tecnica = '.$idx, $cnx, 'descripcion');
							echo $datosmotor[0];
							?></td><?php
                                            break;
                                           case 4: ?>
                                                        <td><?php
							$idx = $reg[$i];
							$datosmotor = general_sacarRegistroPorCondicion('clasificacion_uso', 'id_clasificacion_uso = '.$idx, $cnx, 'descripcion');
							echo $datosmotor[0];
							?></td><?php
                                            break;
                                          case 5: ?>
                                                        <td><?php
							$idx = $reg[$i];
							$datosmotor = general_sacarRegistroPorCondicion('responsable_indicador', 'id_responsable_indicador = '.$idx, $cnx, 'nombre');
							echo $datosmotor[0];
							?></td><?php
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
					if ($value =='Marcar'){
						?>
						<td><input id="<?php echo $reg[0] ?>" type="checkbox" name="option1" onClick="marcar('<?php echo $reg[0]?>');"> </td>
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

function conf($ind){
    $cant_var=sizeof($ind);
    $cnx = bdd_conectar();
     $idin='';
    for ($i=0; $i<$cant_var; $i++){
        ?>
        <form method="POST" action="buscar.php?action=graficar">
        <font color="gren" size=4>INDICADOR <?PHP ECHO $i+1; ?></font>
        <table width="100%"><?php
         // se extraen los datos de la sentencia
        $q='SELECT f.id_ficha_tecnica, f.nombre, v.nombre,  v.iniciales, s.sentencia_sql, s.id_conexion
        FROM ficha_tecnica as f, ficha_tecnica_variable as fv, variable_dato as v, sentencia as s
        WHERE f.id_ficha_tecnica = fv.id_ficha_tecnica AND fv.id_variable = v.id_variable AND v.id_sentencia = s.id_sentencia and
        f.id_ficha_tecnica= '.$ind[$i];
        $rs = bdd_pg_query($cnx, $q);
        $rs1 = bdd_pg_query($cnx, $q);
        $reg = bdd_pg_fetch_row($rs);
        $idcon=$reg[5];?>
        <tr class="frm-fld-x"><td width="20%">NOMBRE DEL INDICADOR</td><td width="80%"><font color="red" size=4><?php echo $reg[1];?></font></td></tr>
        <?php
        $n=0;
        while ($reg1 = bdd_pg_fetch_row($rs1)) { ?>
            <tr class="frm-fld-x"><td width="20%">Nombre de la Variable</td>
                <td width="80%"><?php echo $reg1[2].' - '.$reg1[3];?></td></tr> <?php
            //se listan los campos para filtrar datos
            $campo[$n]= comparar1($reg1[5],$reg1[4]);
            $cant_cam=sizeof($campo[$n]);
            $n++;
        }
        $cant_mas=sizeof($campo);
        switch ($cant_mas) {
            case 1:

            break;
            case 2:
                $r=0;
              unset($campof);
                foreach ($campo[0] as $campo0) {
                    foreach ($campo[1] as $campo1) {
                        if ($campo0 == $campo1){
                             $campof[$r]=$campo0;
                             $r++;
                         }
                     }
                 }
            break;
        } ?>
        </table>
        <?php  
            $numf=sizeof($campof);
                $e = 0;
                $tem='';
                while ($e < $numf  ) {
                    $fname = $campof[$e];
                    if($fname<>'cantidad'){
                            $q="SELECT DISTINCT ON (".$fname.") ".$fname."  from (".$reg[4].")as ".$fname." order by ".$fname;  
                            $tem=$tem.','.$fname;
                            if( strtoupper($fname)<>'MES') {
                            ?>
                                <table width="100%">
                                <TR class="frm-fld-x-odd">
                                        <TD width="20%" align="RIGHT"><?php echo strtoupper($fname); ?></TD>
                                        <TD width="80%">
                                            <?php if (strtoupper($fname)=='EDAD') { ?>
                                             Simple <select name="<?php echo $fname.$ind[$i]; ?>" size="1" id="<?php echo $fname.$ind[$i]; ?>" onchange=" bloquear(<?php echo $ind[$i]; ?>, this);">
                                                        <option selected="selected"> [Todos ..]</option>
                                                      <?php llenarcombo($idcon,$q); ?>
                                             </select> Rango
                                                        <input type='text' tabindex="1" name="<?php echo 'edad1'.$ind[$i]; ?>" id="<?php echo 'edad1'.$ind[$i]; ?>" maxlength="5" size="2" onkeypress='validate(event)' />
                                                        <input type='text' tabindex="1" name="<?php echo 'edad2'.$ind[$i]; ?>" id="<?php echo 'edad2'.$ind[$i]; ?>" maxlength="5" size="2" onkeypress='validate(event)' />
                                            <?php }else{ ?>
                                                        <?php if (strtoupper($fname)=='ANIO') { ?>
                                                      <select name="<?php echo $fname.$ind[$i]; ?>" size="1" id="<?php echo $fname.$ind[$i]; ?>" >
                                                                 <?php llenarcombo($idcon,$q); ?>
                                                      </select>Rango Meses
                                                      
                                                      <select name="<?php echo 'fec1'.$ind[$i]; ?>" size="1" id="<?php echo 'fec1'.$ind[$i]; ?>" >
                                                         <option selected="selected"> [Todos ..]</option>
                                                         <option value="1" >Enero</option>
                                                         <option value="2" >Febrero</option>
                                                         <option value="3" >Marzo</option>
                                                         <option value="4" >Abril</option>
                                                         <option value="5" >Mayo</option>
                                                         <option value="6" >Junio</option>
                                                         <option value="7" >Julio</option>
                                                         <option value="8" >Agosto</option>
                                                         <option value="9" >Septiembre</option>
                                                         <option value="10" >Octubre</option>
                                                         <option value="11" >Noviembre</option>
                                                         <option value="12" >Diciembre</option>
                                                      </select>
                                                      
                                                      <select name="<?php echo 'fec2'.$ind[$i]; ?>" size="1" id="<?php echo 'fec2'.$ind[$i]; ?>" >
                                                         <option selected="selected"> [Todos ..]</option>
                                                         <option value="1" >Enero</option>
                                                         <option value="2" >Febrero</option>
                                                         <option value="3" >Marzo</option>
                                                         <option value="4" >Abril</option>
                                                         <option value="5" >Mayo</option>
                                                         <option value="6" >Junio</option>
                                                         <option value="7" >Julio</option>
                                                         <option value="8" >Agosto</option>
                                                         <option value="9" >Septiembre</option>
                                                         <option value="10" >Octubre</option>
                                                         <option value="11" >Noviembre</option>
                                                         <option value="12" >Diciembre</option>
                                                      </select>
                                                    <?php }else{ ?>
                                                        <select name="<?php echo $fname.$ind[$i]; ?>" size="1" id="<?php echo $fname.$ind[$i]; ?>">
                                                                <option selected="selected"> [Todos ..]</option>
                                                                <?php llenarcombo($idcon,$q); ?>
                                                        </select>
                                                    <?php }
                                                    
                                                    } ?>
                                            <?php } ?>
                                        </TD>
                                </TR>
                            </table><?php
                     }    $e++;
                } ?>
        <input type="hidden" name="campos" id="campos<?php echo $ind[$i];?>" value="<?php echo $tem;?>" />
                <table width="100%"> <tr class="frm-fld-x-odd">
                        <td width="20%">AGRUPADO POR:</td><td width='80%'><?PHP
            $numf=sizeof($campof);
            $h = 0;
               while ($h <$numf  ) {
                   if($campof[$h]<>'cantidad' ){
                       if($campof[$h]<>'mes'){
                       switch ($campof[$h]) {
				case 'edad':
					?><input type="radio" name="g<?php echo $ind[$i];?>[]" id="g<?php echo $ind[$i];?>" value="<?php echo $campof[$h]; ?>" onclick="rangos(<?php echo $ind[$i];?>)" /> <?php echo strtoupper($campof[$h]);
                                        ?><div id="resultado<?php echo $ind[$i];?>"></div><?php
				break;
                                case 'anio':
					?><input type="radio" name="g<?php echo $ind[$i];?>[]" id="g<?php echo $ind[$i];?>" value="<?php echo $campof[$h]; ?>" onclick="rangos1(<?php echo $ind[$i];?>)" /> <?php echo strtoupper($campof[$h]);
                                        ?><div id="resultado1<?php echo $ind[$i];?>"></div><?php
				break;
                                default:
                                   ?><input type="radio" name="g<?php echo $ind[$i];?>[]" id="g<?php echo $ind[$i];?>" value="<?php echo $campof[$h]; ?>" checked/> <?php echo strtoupper($campof[$h]); ?><br /><?php
                       	break;
			}
                   }}
                   $h++;
                }?>
                    <input type="radio" name="g<?php echo $ind[$i];?>[]" id="g<?php echo $ind[$i];?>" value="PAIS" checked/> PAIS
                      </td></tr></table> <?php
                 ?><table width="100%"> <tr class="frm-fld-x-odd">
                        <td width="20%">TIPO DE PRESENTACION:</td><td width='80%'><?PHP
                            $qp='SELECT p.descripcion FROM ficha_tecnica as f, ficha_tecnica_presentacion as fp, cat_presentacion as p
                            WHERE f.id_ficha_tecnica = fp.id_ficha_tecnica AND fp.id_presentacion = p.id_presentacion and f.id_ficha_tecnica='.$ind[$i];
                            $rsp = bdd_pg_query($cnx, $qp);
                while ($regp = bdd_pg_fetch_row($rsp)  ) {  

                            ?> <input type="radio" name="p<?php echo $ind[$i];?>[]" id="p<?php echo $ind[$i];?>" value="<?php echo $regp[0]; ?>" checked/> <?php echo strtoupper($regp[0]); ?>                         <?php
                 }
                $idin=$idin.','.$ind[$i];
                ?>
  </td></tr></table> <?php
  }
  ?> <div align="center" class="frm-fld-x">
<input type="hidden" name="datos" id="datos" value="<?php echo $idin;?>" />
<input type="hidden" name="action" id="action" value="graficar" />
<input type="hidden" name="campos" id="campos" />
<input class="frm-btn-x" type="submit" name="add" title="Graficar" id="Add" onclick="irpanel1();" value="Graficar" />
<input tabindex="7" class="frm-btn-x" type="button" name="cancel" title="Cancelar" id="Cancel" value="Cancelar" onclick="javascript:window.location=('buscar.php?action=buscar');" /></div>
<script type="text/javascript">
function bloquear(id,obj){
    var valor=obj.value;
    var txt='edad1'+id;
    var txt1='edad2'+id;
    document.getElementById(txt).disabled=true;
    document.getElementById(txt1).disabled=true;
    if (valor=='[Seleccione Uno ..]'){
        document.getElementById(txt).disabled=false;
        document.getElementById(txt1).disabled=false;
 
    }
}

</script>
</form>
<?PHP
    bdd_cerrar($cnx);
}

function graficar(){
$datos = (isset($_REQUEST['datos'])) ? $_REQUEST['datos'] : '%'; // se obtiene el o los id del indicador
$datos = substr($datos, 1); //se elimina la ',' de la variable del id indicador
$campos = (isset($_POST['campos'])) ? $_POST['campos'] : '%'; //se obtienen los nombres de los campos para filtrar y agrupar el indicador
$campos = substr($campos, 1); // se limpia la variable de campos de simbolo &
$cnx = bdd_conectar();
$idind = explode(",",$datos);
$incam = explode("&",$campos);
$cant_var=sizeof($idind); //cantidad de indicadores en la consulta
    for ($i=0;$i<$cant_var;$i++){
        $edad1 = (isset($_REQUEST['edad1'.$idind[$i]])) ? $_REQUEST['edad1'.$idind[$i]] : '%';
        $edad2 = (isset($_REQUEST['edad2'.$idind[$i]])) ? $_REQUEST['edad2'.$idind[$i]] : '%';
        $fec1 = (isset($_REQUEST['fec1'.$idind[$i]])) ? $_REQUEST['fec1'.$idind[$i]] : '%';
        $fec2 = (isset($_REQUEST['fec2'.$idind[$i]])) ? $_REQUEST['fec2'.$idind[$i]] : '%';
        if($fec1=='[Todos ..]' or $fec2=='[Todos ..]'){
            $fec1='[Todos ..]'; 
            $fec2='[Todos ..]';
        }
        if($fec1>$fec2){
            $fec1='[Todos ..]'; 
            $fec2='[Todos ..]';
        }
        $grupo_e=(isset($_REQUEST['grupo'.$idind[$i]])) ? $_REQUEST['grupo'.$idind[$i]] : '0';
        $periodo=(isset($_REQUEST['periodo'.$idind[$i]])) ? $_REQUEST['periodo'.$idind[$i]] : '0';
        $grupo = (isset($_POST['g'.$idind[$i]])) ? $_POST['g'.$idind[$i]] : '%'; //campo de agrupacion 'agrupado por'
        $tipo = (isset($_POST['p'.$idind[$i]])) ? $_POST['p'.$idind[$i]] : '%'; // tipo de grafico
        //se obtiene los datos de las variables para calcular el indicador
        $q='SELECT s.sentencia_sql, s.id_sentencia, f.formula, v.iniciales, f.nombre, s.id_conexion, v.es_poblacion
        FROM ficha_tecnica as f, ficha_tecnica_variable as fv, variable_dato as v, sentencia as s
        WHERE f.id_ficha_tecnica = fv.id_ficha_tecnica AND fv.id_variable = v.id_variable AND v.id_sentencia = s.id_sentencia and
        f.id_ficha_tecnica='.$idind[$i].' order by fv.orden';
        $rs = bdd_pg_query($cnx, $q);
        $m=0;
        $formula='';
$six=1;
        // se calcula cada variable
        while ($reg = bdd_pg_fetch_row($rs)){
            $es_poblacion=$reg[6];
            $idcon[$m]=$reg[5];
            $texto='FILTRADO POR: ';
            $variable='var'.'_'.$reg[1]; //variables
            $$variable[0]=$reg[0];  //sentencias SQL de las variables
            $$variable[1]=$reg[1]; //id de las variables
            $campo[$i] = explode(",",$incam[$i]); 
            $cant_cam=sizeof($campo[$i]); //cantidad de campos por variables
            $filtro='';
            // verificar si ha filtrado en algunos de los campos y vrea el segmento de la sentencia SQL para filtrar 'where'
            for ($e=0;$e<$cant_cam;$e++){
               $w[$e] = (isset($_POST[$campo[$i][$e].$idind[$i]])) ? $_POST[$campo[$i][$e].$idind[$i]] : '%';
                if ($campo[$i][$e] == 'anio' and $grupo[0]=='anio' and $periodo==0){
                    $w[$e]='[Todos ..]';
                }
                if ($campo[$i][$e] == 'mes'){
                    $w[$e]='[Todos ..]';
                }
                if ($w[$e]<>'[Todos ..]'){
                    $filtro= $filtro.' and '.$campo[$i][$e]."= '".$w[$e]."'";
                    $texto=$texto.' '.$campo[$i][$e]."= ".$w[$e].", ";
                }
 
                if ($campo[$i][$e]=='edad' AND $edad1<>'' AND $edad2<>'' ){
                   $filtro= $filtro.' and '.$campo[$i][$e]." BETWEEN ".$edad1." AND ".$edad2.' ' ;
                   $texto=$texto.' '.$campo[$i][$e]." desde ".$edad1." hasta ".$edad2.' anio ,';
                }
                
                if ($campo[$i][$e]=='anio' AND $fec1<>'[Todos ..]' AND $fec2<>'[Todos ..]' ){
                   $filtro= $filtro." and mes BETWEEN ".$fec1." AND ".$fec2.' ' ;
                   $texto=$texto.' '.$campo[$i][$e]." desde ".$fec1." hasta ".$fec2.' ,';
                }
            }
            $filtro=' where '. substr($filtro,5);
           // print $filtro;
           if(strlen($texto)<=14){
               $texto=$texto." Nivel nacional y ";
           }
            //genera la sentencia SQL dependiendo del la agupacion de los datos seleccionada
            
            switch ($grupo[0]) {
                    case 'PAIS':
                        $qq[$m]='select sum(cantidad) as cantidad from ('.$reg[0].') as tem ' ;
                    break;
                    case 'edad':
                        if($filtro<>' where '){
                             if ($grupo_e==0){
                                $texto=$texto.' AGRUPADO POR: '.$grupo[0];
                                 $qq[$m]='select sum(cantidad) as cantidad, '.$grupo[0].' from ('.$reg[0].') as tem '.$filtro.' group by '.$grupo[0].' order by '.$grupo[0];
                             }else{
                                $gq='SELECT  descripcion, sentencia FROM grupos_etarios where id_grupo='.$grupo_e;
                                 $grs= bdd_pg_query($cnx, $gq);
                                    $greg = bdd_pg_fetch_row($grs);
                                     $texto=$texto.' AGRUPADO POR: '.$greg[0];
                                $qq[$m]='select sum(cantidad), grupo from ( '.$greg[1].' from ('.$reg[0].') as tem '.$filtro.' ) as x group by grupo order by grupo';
                             }
                        }else{
                             if ($grupo_e==0){
                                 $texto=$texto.' AGRUPADO POR: '.$grupo[0];
                                $qq[$m]='select sum(cantidad) as cantidad, '.$grupo[0].' from ('.$reg[0].') as tem  group by '.$grupo[0].' order by '.$grupo[0];
                             }else{
                                $gq='SELECT  descripcion, sentencia FROM grupos_etarios where id_grupo='.$grupo_e;
                                 $grs= bdd_pg_query($cnx, $gq);
                                    $greg = bdd_pg_fetch_row($grs);
                                    $texto=$texto.' AGRUPADO POR: '.$greg[0];
                                 $qq[$m]='select sum(cantidad), grupo from ( '.$greg[1].' from ('.$reg[0].') as tem ) as x group by grupo order by grupo';
                             }
                        }
                    break;
                    case 'anio':
                        if($filtro<>' where '){
                             if ($periodo==0){
                                 $texto=$texto.' AGRUPADO POR: '.$grupo[0];
                                $qq[$m]='select sum(cantidad) as cantidad, '.$grupo[0].' from ('.$reg[0].') as tem '.$filtro.' group by '.$grupo[0].' order by '.$grupo[0];
                             }else{
                                $gq='SELECT  descripcion, sentencia FROM periodos where id_periodo='.$periodo;
                                 $grs= bdd_pg_query($cnx, $gq);
                                    $greg = bdd_pg_fetch_row($grs);
                                    $texto=$texto.' AGRUPADO POR: '.$greg[0];
                                $qq[$m]='select sum(cantidad), mes from ( '.$greg[1].' from ('.$reg[0].') as tem '.$filtro.' ) as x group by mes order by mes';
                             }
                        }else{
                             if ($periodo==0){
                                 $texto=$texto.' AGRUPADO POR: '.$grupo[0];
                                $qq[$m]='select sum(cantidad) as cantidad, '.$grupo[0].' from ('.$reg[0].') as tem  group by '.$grupo[0].' order by '.$grupo[0];
                             }else{
                                $gq='SELECT  descripcion, sentencia FROM periodos where id_periodo='.$periodo;
                                 $grs= bdd_pg_query($cnx, $gq);
                                    $greg = bdd_pg_fetch_row($grs);
                                    $texto=$texto.' AGRUPADO POR: '.$greg[0];
                                 $qq[$m]='select sum(cantidad), mes from ( '.$greg[1].' from ('.$reg[0].') as tem ) as x group by mes order by mes';
                             }
                        }
                    break;

                    default:
                        if($filtro<>' where '){
                            $texto=$texto.' AGRUPADO POR: '.$grupo[0];
                            $qq[$m]='select sum(cantidad) as cantidad, '.$grupo[0].' from ('.$reg[0].') as tem '.$filtro.' group by '.$grupo[0].' order by '.$grupo[0];
                        }else{
                            $texto=$texto.' AGRUPADO POR: '.$grupo[0];
                            $qq[$m]='select sum(cantidad) as cantidad, '.$grupo[0].' from ('.$reg[0].') as tem  group by '.$grupo[0].' order by '.$grupo[0];
                        }
                    break;
            }
//print $qq[$m];
//print '<br />';
           $rss[$m]= consulta($reg[5], $qq[$m]);
            
            if($formula==''){
                $formula=$reg[2];
            }

            $m++;
           }


          $formulax = str_replace("{","",$formula);
            $formulax = str_replace("}","",$formula);
            $formulax = str_replace("(","",$formula);
            $formulax = str_replace(")","",$formula);
            $datosx = explode("*",$formulax);
            //$formula = str_replace("*100","",$formula);
//            print $datosx[1];
          $x=0;
//         $var1= explode("/",$formula);
          $yg = array();
          $xg = array();
          $seriey="'{";
          $seriex="'{";
                 print '<br />'.$es_poblacion.'<br />';
          while (($reg1 = consulta1($idcon[0],$rss[0]) )){
            switch ($grupo[0]) {
                    case 'PAIS':
                        $qq1='select sum(cantidad) from ('.$qq[1].') as x ' ;
                        $regx = consulta2($idcon[1],$qq1);
                    break;
                    case 'edad':
                        if ($grupo_e==0){
                            $qq1='select sum(cantidad), '.$grupo[0].' from ('.$qq[1].') as x where '.$grupo[0]." = '".$reg1[1]."' group by ".$grupo[0];
                            $regx = consulta2($idcon[1],$qq1);
                        }else{
                            $gq='SELECT  descripcion, sentencia FROM grupos_etarios where id_grupo='.$grupo_e;
                            $grs= bdd_pg_query($cnx, $gq);
                            $greg = bdd_pg_fetch_row($grs);
                            $qqs = str_replace("group by grupo order by grupo","",$qq[1]);
                            $qq1=' '.$qqs." where grupo = '".$reg1[1]."' group by grupo order by grupo ";
                            $regx = consulta2($idcon[1],$qq1);
                        }
                    break;
                    case 'anio':
                        
                        
                        if ($periodo==0){
                            $qq1='select sum(cantidad), '.$grupo[0].' from ('.$qq[1].') as x where '.$grupo[0]." = '".$reg1[1]."' group by ".$grupo[0];
                            $regx = consulta2($idcon[1],$qq1);
                        }else{
                            if ( $es_poblacion == 't'){
                                if($es_poblacion == 't' and $six==1){
                                    $qq1=$qq[1];
                                    //$qq1='select sum(cantidad), '.$grupo[0].' from ('.$qq[1].') as x where '.$grupo[0]." = '".$reg1[1]."' group by ".$grupo[0];
                                    print '<br />'. print $qq1;
                                    $regx = consulta2($idcon[1],$qq1);
                                    $six=0;
                                }else{
                                print $regx.'<br />';
                                $regx=$regx;
                                }
                                
                            }else{
                                $gq='SELECT  descripcion, sentencia FROM periodos where id_periodo='.$periodo;
                                $grs= bdd_pg_query($cnx, $gq);
                                $greg = bdd_pg_fetch_row($grs);
                                $qqs = str_replace("group by mes order by mes","",$qq[1]);
                                $qq1=' '.$qqs." where mes = '".$reg1[1]."' group by mes order by mes ";
                                 $regx = consulta2($idcon[1],$qq1);
                            }
                        }
                    break;
                    default:
                        $qq1='select sum(cantidad), '.$grupo[0].' from ('.$qq[1].') as x where '.$grupo[0]." = '".$reg1[1]."' group by ".$grupo[0];
                         $regx = consulta2($idcon[1],$qq1);
                    break;

            }
//print '<br />'. print $qq1;
            $yg[$x]=$reg1[0]/$regx[0];
            $yg[$x]=$yg[$x]*$datosx[1];
//ojo            //if($yg[$x]>250){
            //    $yg[$x]=$reg1[0]/$regx[0];
            //    $yg[$x]=$yg[$x]*$datosx[1];
            //}
            
            switch ($grupo[0]) {
                    case 'PAIS':
                        $xg[$x]=' Total Pais ' ;
                    break;
                    case 'EDAD':
                        $xg[$x]=substr(str_replace(" ","_",$reg1[1]), 0,6);
                    break;
                    default:
                        $xg[$x]=substr(str_replace(" ","_",$reg1[1]), 0,6);
                    break;
            }
            $seriey=$seriey.$yg[$x].' , ';
            $seriex=$seriex."\"".$xg[$x].'" , ';
            $x++;
         }
         $seriey=substr($seriey,0,strlen($seriey)-2)."}'";
         $seriex=substr($seriex,0,strlen($seriex)-2)."}'";
         $cant_x=sizeof($xg);
         $cant_y=sizeof($yg);
         $qv="SELECT id_usuario, id_indicador, temporal, seriex, seriey, tipop FROM series where id_indicador=".$idind[$i].' and id_usuario= '.$_SESSION['uid'];
         $rsv= bdd_pg_query($cnx, $qv);
         $num=@bdd_pg_num_rows($rsv);
        if($num>0){
         //   INSERT INTO series(id_usuario, id_indicador, temporal, seriex, seriey, tipop, tem,id_serie, texto)
            $qv = "DELETE FROM series where id_indicador=".$idind[$i].' and id_usuario= '.$_SESSION['uid'].' and  temporal= 1';
         $rsv = @bdd_pg_query($cnx, $qv); 
        }
         $qs="INSERT INTO series(id_usuario, id_indicador, temporal, seriex, seriey, tipop, tem, texto) VALUES ( ".
          $_SESSION['uid']." , ".$idind[$i]." , ". 1 ." , ".  $seriex." , ". $seriey." , '". $tipo[0]."' , ".($idind[$i]+100).", '".$texto."')";
         $rssxy = bdd_pg_query($cnx, $qs);
	 $af = bdd_pg_affected_rows($rssxy);
         if($grupo[0]=='PAIS'){
                $xg=' Total Pais ' ;
         }
         jpg($xg,$yg,($idind[$i]+100),$tipo[0],$cnx,1,$idind[$i],$texto);
       ?>
<input type="hidden" name="datos" id="datos" />
<?php
    }
}

function jpg($x,$y,$id,$tipo,$cnx,$p,$idind,$texto){
    require_once ('../../addons/jpg/src/jpgraph.php');
    include_once("../../addons/general/general.php");
    include_once("indicadores.php");
    if($p==1){
      $p='li1_';
    }else{
      $p='li2_';
    }
    $q='SELECT nombre FROM ficha_tecnica WHERE id_ficha_tecnica='.$idind;
    $rs= bdd_pg_query($cnx, $q);
    $reg = bdd_pg_fetch_row($rs);
    print "<form>";
    $datay=$y;
    $datax=$x;
    switch ($tipo) {
        case 'Barra':
            require_once ('../../addons/jpg/src/jpgraph_bar.php');
            $graph = new Graph(400,240);
            $graph->img->SetMargin(60,20,35,75);
            $graph->SetScale("textlin");
            $graph->SetMarginColor("lightblue:1.1");
            $graph->SetShadow();
            // Set up the title for the graph
            $graph->title->Set($reg[0]);
            $graph->title->SetMargin(8);
            $graph->title->SetFont(FF_VERDANA,FS_BOLD,6);
            $graph->title->SetColor("darkred");
            // Setup font for axis
            $graph->xaxis->SetFont(FF_VERDANA,FS_NORMAL,6);
            $graph->yaxis->SetFont(FF_VERDANA,FS_NORMAL,6);
            // Show 0 label on Y-axis (default is not to show)
            $graph->yscale->ticks->SupressZeroLabel(false);
            // Setup X-axis labels
            $graph->xaxis->SetTickLabels($datax);
            $graph->xaxis->SetLabelAngle(50);
            // Create the bar pot
            $bplot = new BarPlot($datay);
            $bplot->SetWidth(0.6);
            // Setup color for gradient fill style
            $bplot->SetFillGradient("navy:0.9","navy:1.85",GRAD_LEFT_REFLECTION);
            // Set color for the frame of each bar
            $bplot->SetColor("white");
            $graph->Add($bplot);
        break;
        case 'Circular':
            require_once ('../../addons/jpg/src/jpgraph_pie.php');
            require_once ('../../addons/jpg/src/jpgraph_pie3d.php');
            $data = $datay;
            // Create the Pie Graph.
            $graph = new PieGraph(350,300);
            $graph->SetShadow();
            // Set A title for the plot
            $graph->title->Set($reg[0]);
            $graph->title->SetFont(FF_VERDANA,FS_BOLD,6);
            // Create plots
            $size=0.22;
            $p1 = new PiePlot3D($data);
            $p1 ->SetAngle(80);
            $p1->SetLegends($datax);
            $p1->SetSize($size);
            $p1->SetCenter(0.25,0.60);
            $p1->value->SetFont(FF_FONT0);
            $graph->Add($p1);
        break;
        case 'Linea':
            $cant_masy=sizeof($datay);
            if ($cant_masy<=1){
                print "<p class='colorr'>Error al seleccionar los parametros</p>";
                exit;
            }else{
                require_once ('../../addons/jpg/src/jpgraph.php');
                require_once ('../../addons/jpg/src/jpgraph_line.php');
                $datay1 = $datay;
                // Setup the graph
                $graph = new Graph(300,250);
                $graph->SetScale("textlin");
                $graph->title->Set($reg[0]);
                $graph->title->SetFont(FF_VERDANA,FS_BOLD,6);
                $graph->SetBox(false);
               // $graph->xaxis->SetLabelAngle(50);
                $graph->xaxis->SetFont(FF_VERDANA,FS_NORMAL,6);
                $graph->yaxis->SetFont(FF_VERDANA,FS_NORMAL,6);
                $graph->yaxis->HideZeroLabel();
                $graph->yaxis->HideLine(false);
                $graph->yaxis->HideTicks(false,false);
                $graph->xgrid->Show();
                $graph->xgrid->SetLineStyle("solid");
                $graph->xaxis->SetTickLabels($datax);
                $graph->xgrid->SetColor('#E3E3E3');
                $graph->xaxis->SetLabelAngle(50);
                // Create the first line
                $p1 = new LinePlot($datay1);
                $graph->Add($p1);
                $p1->SetColor("#6495ED");
                $graph->legend->SetFrameWeight(1) ;
            }
        break;
        case 'Odometro':
            require_once ("../../addons/jpg/src/jpgraph.php");
            require_once ("../../addons/jpg/src/jpgraph_odo.php");
            // Create a new odometer graph (width=250, height=200 pixels)
            $graph = new OdoGraph(250,150);
            $graph->title->Set('Example with scale indicators');
            $graph->SetShadow();
            $odo = new Odometer(ODO_HALF);
            // Add color indications
            $odo->AddIndication(0,20,"green:0.7");
            $odo->AddIndication(20,30,"green:0.9");
            $odo->AddIndication(30,60,"yellow");
            $odo->AddIndication(60,80,"orange");
            $odo->AddIndication(80,100,"red");
            // Set display value for the odometer
            $odo->needle->Set(90);
            $odo->needle->SetShadow();
            $graph->Add($odo) or die ("<p class='colorr'>Error al seleccionar los parametros</p>");
        break;
     }
  $graph->Stroke('../indicadores/img/'.$p.$id.'g.png') ;
}

function comparar1($conexion,$sentencia){
    $cnx = bdd_conectar();
    $q = '	SELECT
                    conexion.id_motor,
                    conexion.puerto,
                    conexion.instancia,
                    conexion.ip,
                    conexion.usuario,
                    conexion.clave,
                    conexion.nombre_base_datos
            FROM
                    public.conexion
            where
                    conexion.id_conexion='.$conexion;
    $rs = bdd_pg_query($cnx, $q);
    if ($rs) {
            $reg = bdd_pg_fetch_row($rs);
            $reg[5]=decriptar_clave(utf8_decode($reg[5]));
            $ip=$reg[3];
            if ($ip== '127.0.0.0'){
                    $ip="localhost";
            }
            if ($reg[2]!=""){
                    $ip=$ip."\ ".$reg[2];
                    $ip= ereg_replace( "([     ]+)", "", $ip );
            }
             $motor=$reg[0];
    }else{
            print 'Problemas con la conexion';
    }
    switch ($motor) {
        case 1:
                $linkmysql = @mysqli_connect($ip, $reg[4], $reg[5], $reg[6]) or die ("<p class='colorr'>conexion Fallida</p>");
                $rsmysql = @mysqli_query($linkmysql,$sentencia)  or die ("<p class='colorr'>Sentencia Fallida</p>");
                $numf = @mysqli_num_fields($rsmysql);
        break;
        case 2:
                $str='host=' . $ip . ' port=' . $reg[1] . ' dbname=' . $reg[6] . ' user=' . $reg[4] . ' password=' . $reg[5] ;
                $linkpg = @pg_pconnect($str) or die ("<p class='colorr'>conexion Fallida</p>");
                $rspg= @pg_query($linkpg, $sentencia)  or die ("<p class='colorr'>Sentencia Fallida</p>");
                $numf= @pg_num_fields($rspg);
        break;
        case 3:
                $linkms = @mssql_connect($ip,$reg[4],$reg[5]) or die ("<p class='colorr'>conexion Fallida</p>");
                @mssql_select_db($reg[6]);
                $rsms= @mssql_query($sentencia,$linkms) or die ("<p class='colorr'>Sentencia Fallida</p>");
                $numf= @mssql_num_fields($rsms);
        break;
    }
    $e = 0;
    while ($e < $numf  ) {
        switch ($motor) {
                case 1:
                        $meta = @mysqli_fetch_field($rsmysql); 
                        $fname = $meta->name;
                break;
                case 2:
                        $meta = @pg_field_name($rspg,$e); 
                        $fname = $meta;
                break;
                case 3:
                        $meta = @mssql_fetch_field($rsms); 
                        $fname = $meta->name;
                break; 
        }
        $campo[$e]=$fname;
        $e++;
    }
    return $campo;
 }

function llenarcombo($conexion,$sentencia){
    $cnx = bdd_conectar();
    $q = '	SELECT
                    conexion.id_motor,
                    conexion.puerto,
                    conexion.instancia,
                    conexion.ip,
                    conexion.usuario,
                    conexion.clave,
                    conexion.nombre_base_datos
            FROM
                    public.conexion
            where
                    conexion.id_conexion='.$conexion;
    $rs = bdd_pg_query($cnx, $q);
    if ($rs) {
            $reg = bdd_pg_fetch_row($rs);
            $reg[5]=decriptar_clave(utf8_decode($reg[5]));
            $ip=$reg[3];
            if ($ip== '127.0.0.0'){
                    $ip="localhost";
            }
            if ($reg[2]!=""){
                    $ip=$ip."\ ".$reg[2];
                    $ip= ereg_replace( "([     ]+)", "", $ip );
            }
            $motor=$reg[0];
    }else{
            print 'Problemas con la conexion';
    }
    switch ($motor) {
        case 1:
                $linkmysql = @mysqli_connect($ip, $reg[4], $reg[5], $reg[6]) or die ("<p class='colorr'>conexion Fallida</p>");
                $rsmysql = @mysqli_query($linkmysql,$sentencia)  or die ("<p class='colorr'>Sentencia Fallida</p>");
        break;
        case 2:
                $str='host=' . $ip . ' port=' . $reg[1] . ' dbname=' . $reg[6] . ' user=' . $reg[4] . ' password=' . $reg[5] ;
                $linkpg = @pg_pconnect($str) or die ("<p class='colorr'>conexion Fallida</p>");
                $rspg= @pg_query($linkpg, $sentencia)  or die ("<p class='colorr'>Sentencia Fallida</p>");
        break;
        case 3:
                $linkms = @mssql_connect($ip,$reg[4],$reg[5]) or die ("<p class='colorr'>conexion Fallida</p>");
                @mssql_select_db($reg[6]);
                $rsms= @mssql_query($sentencia,$linkms) or die ("<p class='colorr'>Sentencia Fallida</p>");
        break;
    }
    switch ($motor) {
            case 1:
                    while ($row = @mysqli_fetch_row($rsmysql)) {
                        echo ('<option value="'.$row[0].'" >'.$row[0].'</option>');
                    }
            break;
            case 2:
                    while ($row = @pg_fetch_row($rspg)) {
                        echo ('<option value="'.$row[0].'" >'.$row[0].'</option>');
                    }
                    @pg_close($linkpg);
            break;
            case 3:
                   while ($row = @mssql_fetch_row($rsms)) {
                        echo ('<option value="'.$row[0].'" >'.$row[0].'</option>');
                    }
                    @mssql_close($linkms);
            break;
    }
}

function consulta($conexion, $sentencia){
       $cnx = bdd_conectar();
    $q = '	SELECT
                    conexion.id_motor,
                    conexion.puerto,
                    conexion.instancia,
                    conexion.ip,
                    conexion.usuario,
                    conexion.clave,
                    conexion.nombre_base_datos
            FROM
                    public.conexion
            where
                    conexion.id_conexion='.$conexion;
    $rs = bdd_pg_query($cnx, $q);
    if ($rs) {
            $reg = bdd_pg_fetch_row($rs);
            $reg[5]=decriptar_clave(utf8_decode($reg[5]));
            $ip=$reg[3];
            if ($ip== '127.0.0.0'){
                    $ip="localhost";
            }
            if ($reg[2]!=""){
                    $ip=$ip."\ ".$reg[2];
                    $ip= ereg_replace( "([     ]+)", "", $ip );
            }
            $motor=$reg[0];
    }else{
            print 'Problemas con la conexion';
    }
    switch ($motor) {
        case 1:
                $linkmysql = @mysqli_connect($ip, $reg[4], $reg[5], $reg[6]) or die ("<p class='colorr'>conexion Fallida</p>");
                $rs = @mysqli_query($linkmysql,$sentencia)  or die ("<p class='colorr'>Sentencia Fallida</p>");
        break;
        case 2:
                $str='host=' . $ip . ' port=' . $reg[1] . ' dbname=' . $reg[6] . ' user=' . $reg[4] . ' password=' . $reg[5] ;
                $linkpg = @pg_pconnect($str) or die ("<p class='colorr'>conexion Fallida</p>");
                $rs= @pg_query($linkpg, $sentencia)  or die ("<p class='colorr'>Sentencia Fallida</p>");
        break;
        case 3:
                $linkms = @mssql_connect($ip,$reg[4],$reg[5]) or die ("<p class='colorr'>conexion Fallida</p>");
                @mssql_select_db($reg[6]);
                $rs= @mssql_query($sentencia,$linkms) or die ("<p class='colorr'>Sentencia Fallida</p>");
        break;
    }
    return $rs;
}

function consulta1($conexion, $rsxx){
    $cnx = bdd_conectar();
    $q = '	SELECT
                    conexion.id_motor,
                    conexion.puerto,
                    conexion.instancia,
                    conexion.ip,
                    conexion.usuario,
                    conexion.clave,
                    conexion.nombre_base_datos
            FROM
                    public.conexion
            where
                    conexion.id_conexion='.$conexion;
    $rs = bdd_pg_query($cnx, $q);
    if ($rs) {
            $reg = bdd_pg_fetch_row($rs);
            $reg[5]=decriptar_clave(utf8_decode($reg[5]));
            $ip=$reg[3];
            if ($ip== '127.0.0.0'){
                    $ip="localhost";
            }
            if ($reg[2]!=""){
                    $ip=$ip."\ ".$reg[2];
                    $ip= ereg_replace( "([     ]+)", "", $ip );
            }
            $motor=$reg[0];
    }else{
            print 'Problemas con la conexion';
    }
    switch ($motor) {
            case 1:
                   $row = @mysqli_fetch_row($rsxx);
            break;
            case 2:
                   $row = @pg_fetch_row($rsxx);
                    @pg_close($linkpg);
            break;
            case 3:
                   $row = @mssql_fetch_row($rsxx);
                    @mssql_close($linkms);
            break;
    }
return $row;
}

function consulta2($conexion, $sentencia){
          $cnx = bdd_conectar();
    $q = '	SELECT
                    conexion.id_motor,
                    conexion.puerto,
                    conexion.instancia,
                    conexion.ip,
                    conexion.usuario,
                    conexion.clave,
                    conexion.nombre_base_datos
            FROM
                    public.conexion
            where
                    conexion.id_conexion='.$conexion;
    $rs = bdd_pg_query($cnx, $q);
    if ($rs) {
            $reg = bdd_pg_fetch_row($rs);
            $reg[5]=decriptar_clave(utf8_decode($reg[5]));
            $ip=$reg[3];
            if ($ip== '127.0.0.0'){
                    $ip="localhost";
            }
            if ($reg[2]!=""){
                    $ip=$ip."\ ".$reg[2];
                    $ip= ereg_replace( "([     ]+)", "", $ip );
            }
            $motor=$reg[0];
    }else{
            print 'Problemas con la conexion';
    }
    switch ($motor) {
        case 1:
                $linkmysql = @mysqli_connect($ip, $reg[4], $reg[5], $reg[6]) or die ("<p class='colorr'>conexion Fallida</p>");
                $rsxx = @mysqli_query($linkmysql,$sentencia)  or die ("<p class='colorr'>Sentencia Fallida</p>");
                $row = @mysqli_fetch_row($rsxx);
        break;
        case 2:
                $str='host=' . $ip . ' port=' . $reg[1] . ' dbname=' . $reg[6] . ' user=' . $reg[4] . ' password=' . $reg[5] ;
                $linkpg = @pg_pconnect($str) or die ("<p class='colorr'>conexion Fallida</p>");
                $rsxx= @pg_query($linkpg, $sentencia)  or die ("<p class='colorr'>Sentencia Fallida</p>");
                $row = @pg_fetch_row($rsxx);
                @pg_close($linkpg);
        break;
        case 3:
                $linkms = @mssql_connect($ip,$reg[4],$reg[5]) or die ("<p class='colorr'>conexion Fallida</p>");
                @mssql_select_db($reg[6]);
                $rsxx= @mssql_query($sentencia,$linkms) or die ("<p class='colorr'>Sentencia Fallida</p>");
                $row = @mssql_fetch_row($rsxx);
                @mssql_close($linkms);
        break;
    }
    return $row;
}
?>