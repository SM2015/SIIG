<?php

/**
*	funciones de proposito general
*/

define("site_url", "/sis",true);

// llenarCombo
// llena un combo a partir de una tabla, usando un campo especifico como id
function general_llenarCombo($tabla, $campo, $id, $desc, $selected, $disable){
	$qry ="SELECT ".$desc.", ".$id." FROM ".$tabla;
	$result = mysql_query($qry);
	echo ('<select class="frm-text-x" name="'.$campo.'" size="1" '.$disable.'>');
	while ($row = mysql_fetch_array($result)) {
		if ($row[1]==$selected) {
			echo ('<option value="'.$row[1].'" selected>'.$row[0].'</option>');
		} else {
			echo ('<option value="'.$row[1].'">'.$row[0].'</option>');
		}
	}
	echo ('</select>');
}
// FIN llenarCombo

// llenarComboConCodicion
// llena un combo a partir de una tabla cumpliendo condicion, usando un campo especifico como id
function general_llenarComboConCodicion($tabla, $campo, $id, $cond, $desc, $selected, $disable){
	$qry ="SELECT ".$desc.", ".$id." FROM ".$tabla." WHERE ".$cond;
	$result = mysql_query($qry);
	//echo $qry;
	echo ('<select class="frm-text-x" name="'.$campo.'" id="'.$campo.'" size="1" '.$disable.'>');
	echo ('<option value="">[Elije una opci&oacute;n]</option>');
	while ($row = mysql_fetch_array($result)) {
		/*if ($row[1]==$selected) {
			echo ('<option value="'.$row[1].'" selected>'.$row[0].'</option>');
		} else { */
			echo ('<option value="'.$row[1].'">'.$row[0].'</option>');
		//}
	}
	echo ('</select>');
}
// FIN llenarComboConCodicion

// llenarComboConCodicionSinOpcion
// llena un combo a partir de una tabla cumpliendo condicion, usando un campo especifico como id
function general_llenarComboConCodicionSinOpcion($tabla, $campo, $id, $cond, $desc, $selected, $disable){
	$qry ="SELECT ".$desc.", ".$id." FROM ".$tabla." WHERE ".$cond;
	$result = mysql_query($qry);
	//echo $qry;
	echo ('<select class="frm-text-x" name="'.$campo.'" id="'.$campo.'" size="1" '.$disable.'>');
//	echo ('<option value="">[Elije una opci&oacute;n]</option>');
	while ($row = mysql_fetch_array($result)) {
		/*if ($row[1]==$selected) {
			echo ('<option value="'.$row[1].'" selected>'.$row[0].'</option>');
		} else { */
			echo ('<option value="'.$row[1].'">'.$row[0].'</option>');
		//}
	}
	echo ('</select>');
}
// FIN llenarComboConCodicionSinOpcion

// llenarComboConCodicionTodos
// llena un combo a partir de una tabla cumpliendo condicion, usando un campo especifico como id
function general_llenarComboConCodicionTodos($tabla, $campo, $id, $cond, $desc, $selected, $disable){
	$qry ="SELECT ".$desc.", ".$id." FROM ".$tabla." WHERE ".$cond;
	$result = mysql_query($qry);
	//echo $qry;
	echo ('<select class="frm-text-x" name="'.$campo.'" size="1" '.$disable.'>');
	echo ('<option selected value="">[ Todos ]</option>');
	while ($row = mysql_fetch_array($result)) {
		if ($row[1]==$selected) {
			echo ('<option value="'.$row[1].'" selected>'.$row[0].'</option>');
		} else { 
			echo ('<option value="'.$row[1].'">'.$row[0].'</option>');
		}
	}
	echo ('</select>');
}
// FIN llenarComboConCodicionTodos

// llenarComboConCodicionTodosOnChange
// llena un combo a partir de una tabla cumpliendo condicion, usando un campo especifico como id
function general_llenarComboConCodicionTodosOnChange($frm, $tabla, $campo, $id, $cond, $desc, $selected, $disable){
	$qry ="SELECT ".$desc.", ".$id." FROM ".$tabla." WHERE ".$cond;
	$result = mysql_query($qry);
	//echo $qry;
	echo ('<select class="frm-text-x" name="'.$campo.'" size="1" '.$disable.' onchange="submit()">');
	echo ('<option selected value="">[ Todos ]</option>');
	while ($row = mysql_fetch_array($result)) {
		if ($row[1]==$selected) {
			echo ('<option value="'.$row[1].'" selected>'.$row[0].'</option>');
		} else { 
			echo ('<option value="'.$row[1].'">'.$row[0].'</option>');
		}
	}
	echo ('</select>');
}
// FIN llenarComboConCodicionTodos




// general_llenarComboConCodicionSeleccionable
// llena un combo a partir de una tabla cumpliendo condicion, usando un campo especifico como id
function general_llenarComboConCodicionSeleccionable($tabla, $campo, $id, $cond, $desc, $selected, $disable){
	$qry ="SELECT ".$desc.", ".$id." FROM ".$tabla." WHERE ".$cond;
	$result = mysql_query($qry);
	//echo $qry;
	echo ('<select class="frm-text-x" name="'.$campo.'" size="1" '.$disable.'>');
	echo ('<option selected value="">[Elije una opci&oacute;n]</option>');
	while ($row = mysql_fetch_array($result)) {
		if ($row[1]==$selected) {
			echo ('<option value="'.$row[1].'" selected>'.$row[0].'</option>');
		} else { 
			echo ('<option value="'.$row[1].'">'.$row[0].'</option>');
		}
	}
	echo ('</select>');
}

// general_llenarComboConCodicionNoSelect
// llena un combo a partir de una tabla cumpliendo condicion, usando un campo especifico como id
function general_llenarComboConCodicionNoSelect($tabla, $campo, $id, $cond, $desc, $selected, $disable){
	$qry ="SELECT ".$desc.", ".$id." FROM ".$tabla." WHERE ".$cond;
	$result = mysql_query($qry);
	//echo $qry;
	echo ('<select class="frm-text-x" name="'.$campo.'" size="1" '.$disable.'>');
	while ($row = mysql_fetch_array($result)) {
		if ($row[1]==$selected) {
			echo ('<option value="'.$row[1].'" selected>'.$row[0].'</option>');
		} else {
			echo ('<option value="'.$row[1].'">'.$row[0].'</option>');
		}
	}
	echo ('</select>');
}
// FIN general_llenarComboConCodicionNoSelect


// general_quitarCadena
// quita el $str de la cadena 
function general_quitarCadena($str, $cad){
	$nwStr = split($str,$cad);
	//print_r($nwStr);
	$clean = "";
	foreach ($nwStr as $value) {
		$clean .= $value . " ";
	}
	return $clean;
}
// FIN general_quitarCadena

// general_randomString
// generates a string of $stringLength chars
function general_randomString($stringLength = 5){
	srand((double)microtime()*1000000);
	$letters = range ('A','Z');
	$numbers = range (1,9);
	$chars = array_merge ($letters, $numbers);
	$randString =''; 
	for ($i=0;$i<$stringLength; $i++){
			shuffle($chars);
			$randString .= $chars[0];
	}
	return $randString;
} //FIN 01_01fRandString 


/**
 * general_limpiarCadena
 * modifica las cadenas ingresadas por el usuario para prevenir ataques
 * 
 * @param object $cnx
 * @param string $str
 * @return string $escape
 */
function general_limpiarCadena($cnx, $str) {
	if (!get_magic_quotes_gpc()) {
		$escape = mysqli_escape_string($cnx, $str);
	} else {
		$escape = $str;
	}
	return $escape;
}

/**
 * general_sacarRegistroPorCondicion
 * muestra el registro filtrado por ID
 * 
 * @param string $tabla
 * @param string $fields
 * @param string $where
 * @return string $r
 */
function general_sacarRegistroPorCondicion($tabla, $where, $cnx, $fields='*') {
	//filtrando registro
	$q = "SELECT ".general_limpiarCadena($cnx,$fields)." FROM ".general_limpiarCadena($cnx,$tabla)." 
	WHERE ".general_limpiarCadena($cnx,$where)." LIMIT 1";
	$rs = mysqli_query($cnx, $q);
	$r = mysqli_fetch_row($rs);
	mysqli_free_result($rs);
	return $r;
}


/**
 * general_Paginacion
 * muestra la paginacion de una consulta
 * phpfreaks.com 
 * Voice of Power >> 	Marc Kuiper
 * 
 * @param string $url
 * @param integer $total_items
 * @param integer $per_page
 * @param integer $start
 * @param integer $range
 * @param string $pages
 * @param boolean $prevnext
 * @param boolean $prevnext_always
 * @param boolean $firstlast
 * @param boolean $firstlast_always
 * @return string $r
 */
function general_Paginacion($url, 
										$total_items, 
										$per_page, 
										$start, 
										$range = 5, 
										$pages = 'total', 
										$prevnext = TRUE, 
										$prevnext_always = TRUE, 
										$firstlast = TRUE, $firstlast_always = TRUE) {

    // The links themselves, for these goes: first %s is the url, the second the text for the link
    $str_links = " <a href='%s'>%s</a> ";
    $str_selected = " <a href='%s'>[%s]</a> ";
    $str_prevnext = " <a href='%s'>%s</a> ";
    $str_firstlast = " <a href='%s'>%s</a> ";

    // The pages text, has only one %s: the text
    $str_pages = "%s ";

    // The text on previous, next, first, and last links. One %s: a (optional) number
    $prev_txt = '&lt;%s';
    $next_txt = '%s&gt;';
    $first_txt = '&laquo;%s';
    $last_txt = '%s&raquo;';

    // Pretty self explanatory now..
    $pages_txt_total = '%s P&aacute;ginas';
    $pages_txt_page = 'P&aacute;gina %s';
    $pages_txt_pageoftotal = 'P&aacute;gina %s de %s <br>';


	/*******************************Start of the code**************************/

    $str = '';

	// First, check on a few parameters to see if they're ok, we don't want negatives
    $total_items = ($total_items <= 0) ? 0 : $total_items;
    $per_page = ($per_page < 1) ? 1 : $per_page;
    $range = ($range < 1) ? 1 : $range;
    $sel_page = 1;

    // Remove the start argument from the url, if it's there, then add the arguments to the url
		
    //$args = (isset($_SERVER['argv'][0])) ? preg_replace('/(start=)(d+)(&|)/i', '', $_SERVER['argv'][0]) : '';
    //$url .= '?' . $args . ((substr($args, -1) == '&') ? '' : '&') . 'start=';
	$url .= '&start=';

    $total_pages = ceil($total_items / $per_page);

	// Are there more than one pages to show? If not, this section will be skipped,
    // and only the pages_text will be shown
	if ($total_pages > 1) {
	    // The page we are on
	    $sel_page = floor($start / $per_page) + 1;

		// The ranges indicate how many pages should be displayed before and after
        // the selected one. Here, it will check if the range is an even number,
        // and adjust the ranges appropriately. It will behave best on non-even numbers
	    $range_min = ($range % 2 == 0) ? ($range / 2) - 1 : ($range - 1) / 2;
	    $range_max = ($range % 2 == 0) ? $range_min + 1 : $range_min;
	    $page_min = $sel_page - $range_min;
	    $page_max = $sel_page + $range_max;

		// This parts checks whether the ranges are 'out of bounds'. If we're at or near
        // the 'edge' of the pagination, we will start or end there, not at the range
        $page_min = ($page_min < 1) ? 1 : $page_min;
        $page_max = ($page_max < ($page_min + $range - 1)) ? $page_min + $range - 1 : $page_max;
        if ($page_max > $total_pages) {
            	$page_min = ($page_min > 1) ? $total_pages - $range + 1 : 1;
            $page_max = $total_pages;
        }


        // Build the links
	    for ($i = $page_min;$i <= $page_max;$i++) {
            $str .= sprintf((($i == $sel_page) ? $str_selected : $str_links), $url . (($i - 1) * $per_page), $i);
	    }


		// Do we got previous and next links to display?
	    if (($prevnext) || (($prevnext) && ($prevnext_always))) {
			// Aye we do, set what they will look like
            $prev_num = (($prevnext === 'num') || ($prevnext === 'nump')) ? $sel_page - 1 : '';
            $next_num = (($prevnext === 'num') || ($prevnext === 'numn')) ? $sel_page + 1 : '';

            $prev_txt = sprintf($prev_txt, $prev_num);
            $next_txt = sprintf($next_txt, $next_num);

            // Display previous link?
	        if (($sel_page > 1) || ($prevnext_always)) {
	            $start_at = ($sel_page - 2) * $per_page;
	            $start_at = ($start_at < 0) ? 0 : $start_at;
	            $str = sprintf($str_prevnext, $url . $start_at, $prev_txt).$str;
	        }
			// Next link?
	        if (($sel_page < $total_pages) || ($prevnext_always)) {
	            $start_at = $sel_page * $per_page;
	            $start_at = ($start_at >= $total_items) ? $total_items - $per_page : $start_at;

	            $str .= sprintf($str_prevnext, $url . $start_at, $next_txt);
	        }
	    }

        // This part is just about identical to the prevnext links, just a few minor
        // value differences
	    if (($firstlast) || (($firstlast) && ($firstlast_always))) {
            $first_num = (($firstlast === 'num') || ($firstlast === 'numf')) ? 1 : '';
            $last_num = (($firstlast === 'num') || ($firstlast === 'numl')) ? $total_pages : '';

            $first_txt = sprintf($first_txt, $first_num);
            $last_txt = sprintf($last_txt, $last_num);

	        if ((($sel_page > ($range - $range_min)) && ($total_pages > $range)) || ($firstlast_always)) {
	            $str = sprintf($str_firstlast, $url . '0', $first_txt).$str;
	        }
	        if ((($sel_page < ($total_pages - $range_max)) && ($total_pages > $range)) || ($firstlast_always)) {
	            $str .= sprintf($str_firstlast, $url . (($total_pages* $per_page)-$per_page), $last_txt);
	        }											

	    }
    } 
	
	// Display pages text?
	if ($pages) {
    	// Decide what to show
		switch ($pages) {
			case 'total':
	    	    $pages_txt = sprintf($pages_txt_total, $total_pages);
				break;
			case 'page':
				$pages_txt = sprintf($pages_txt_page, $sel_page);
        		break;
			case 'pageoftotal':
				$pages_txt = sprintf($pages_txt_pageoftotal, $sel_page, $total_pages);
					break;
		}
		// Replace it
        $str = sprintf($str_pages, $pages_txt) . $str;
    }

	// Done, return the pagination
    return  $total_items." resultados, ".$str;
}


////// AUTO GENERATED


/**
 * general_fillCmbWithCondition
 * fill a combo box fron  $table, using $id as field respecting $cond
 * 
 * @param string 	$table
 * @param string 	$field
 * @param integer	$id
 * @param string	$cond
 * @param string	$desc
 * @param integer	$selected
 * @param string	$disable
 */
// llena un combo a partir de una table cumpliendo condicion, usando un campo especifico como id
function general_fillCmbWithCondition($table, $field, $id, $cond, $desc, $selected, $disable){
	$qry ="SELECT ".$desc.", ".$id." FROM ".$table." WHERE ".$cond;
	$result = mysql_query($qry);
	//echo $qry;
	while ($row = mysql_fetch_row($result)) {
		if ($row[1]==$selected) {
			echo ('<option value="'.$row[1].'" selected>'.$row[0].'</option>');
		} else { 
			echo ('<option value="'.$row[1].'">'.$row[0].'</option>');
		}
	}
} // FIN general_fillCmbWithCondition

//llenado combos Software_Detalle
//Cuando es tipo 1
function general_fillCmblibre($table, $field, $id, $desc, $selected= NULL, $disable =NULL, $cnx){
	$qry ="SELECT ".$desc.", ".$id." FROM ".$table." where catsoft_tipo='1' ORDER BY ".$desc;
	$result = bdd_my_query($cnx,$qry);
	//echo $qry . mysql_error();
	// echo ('<select name="'.$field.'" size="1" '.$disable.'>');
	while ($row = bdd_my_fetch_row($result)) {
		if ($row[1]==$selected) {
			echo ('<option value="'.$row[1].'" selected>'.$row[0].'</option>');
		} else {
			echo ('<option value="'.$row[1].'">'.$row[0].'</option>');
		}
	}
	//echo ('</select>');
}
// Mostrar tipo 2
function general_fillCmbcomercial($table, $field, $id, $desc, $selected= NULL, $disable =NULL, $cnx){
	$qry ="SELECT ".$desc.", ".$id." FROM ".$table." where catsoft_tipo='2' ORDER BY ".$desc;
	$result = bdd_my_query($cnx,$qry);
	//echo $qry . mysql_error();
	// echo ('<select name="'.$field.'" size="1" '.$disable.'>');
	while ($row = bdd_my_fetch_row($result)) {
		if ($row[1]==$selected) {
			echo ('<option value="'.$row[1].'" selected>'.$row[0].'</option>');
		} else {
			echo ('<option value="'.$row[1].'">'.$row[0].'</option>');
		}
	}
	//echo ('</select>');
}
// FIN general_fillCmb
/**
 * general_fillCmb
 * fill a combo box fron  $table, using $id as field
 * 
 * @param string 	$table
 * @param string 	$field
 * @param integer	$id
 * @param string	$desc
 * @param integer	$selected
 * @param string	$disable
 * @return string 	$escape
 */
// llena un combo a partir de una tabla, usando un field especifico como id
function general_fillCmb($table, $field, $id, $desc, $selected= NULL, $disable =NULL, $cnx){
	$qry ="SELECT ".$desc.", ".$id." FROM ".$table." ORDER BY ".$desc;
	$result = bdd_my_query($cnx,$qry);
	
	//echo $qry . mysql_error();
	// echo ('<select name="'.$field.'" size="1" '.$disable.'>');
	while ($row = bdd_my_fetch_row($result)) {
		if ($row[1]==$selected) {
			echo ('<option value="'.$row[1].'" selected>'.$row[0].'</option>');
		} else {
			echo ('<option value="'.$row[1].'">'.$row[0].'</option>');
		}
	}
	//echo ('</select>');
}
// FIN general_fillCmb

/**
 * general_fillCmb
 * fill a combo box fron  $table, using $id as field
 * 
 * @param integer	$id
 * @param string 	$campo
 * @param string 	$table
 */
// busca en una tabla y en un campo especificsdo si existe un id determinado
function general_buscar_id($id, $campo, $tabla, $cnx){
	// conectar db
	//$cnx = bdd_conectar(BDD_SERVIDOR, BDD_BASEDEDATOS, BDD_USUARIO, BDD_CODIGO);
	$qb = "SELECT ".$campo 
	." FROM ".$tabla."
	WHERE ".$campo." = " .$id;
	$rs = bdd_my_query($cnx, $qb);
	$num = bdd_my_num_rows($rs);
	if ($num>=1) {
		return true;
	} else {
		return false;
	}
}
function general_sacarRegistroPorInner($id,$cnx) {
	//filtrando registro
	$q = "select sis_software_detalle.software_detalle_id, 
sis_software_detalle.softdet_software_id, sis_catalogo_software.software_id, 
sis_catalogo_software.catsoft_tiposoftware_id,
sis_catalogo_tiposoftware.tiposoftware_id,
sis_catalogo_tiposoftware.tiposoftware_nombre

from sis_software_detalle 

inner join sis_catalogo_software 
on sis_catalogo_software.software_id=sis_software_detalle.softdet_software_id

inner join sis_catalogo_tiposoftware
on sis_catalogo_tiposoftware.tiposoftware_id=sis_catalogo_software.catsoft_tiposoftware_id

where sis_software_detalle.softdet_software_id='$id' limit 1 ";
	
	
	$rs = mysqli_query($cnx, $q);
	$r = mysqli_fetch_row($rs);
	mysqli_free_result($rs);
	return $r;
}


function general_obtenerMarcaTipoImp($id,$cnx) {
//filtrando modelo de impresora      (where sis_imp_modelo.modelo_marca_id = 32 and sis_imp_modelo.modelo_tipoimp_id=2)


$q = "select 	sis_imp_modelo.modelo_id, sis_imp_modelo.modelo_descripcion, sis_catalogo_marca_equipo.marca_equipo_id, 
	sis_catalogo_tipo_impresora.tipo_impresora_id

from sis_imp_modelo

inner join sis_catalogo_marca_equipo
on sis_catalogo_marca_equipo.marca_equipo_id= sis_imp_modelo.modelo_marca_id
inner join sis_catalogo_tipo_impresora on sis_catalogo_tipo_impresora.tipo_impresora_id = sis_imp_modelo.modelo_tipoimp_id
where sis_imp_modelo.modelo_marca_id = '$id' limit 1";

$rs = mysqli_query($cnx, $q);
$r = mysqli_fetch_row($rs);
mysqli_free_result($rs);
return $r;

}



function general_fillCmbe($table, $field, $id, $desc, $selected= NULL, $disable =NULL, $cnx){
	$qry ="SELECT ".$desc.", ".$id." FROM ".$table." ORDER BY ".$desc;
	$result = bdd_my_query($cnx,$qry);
	
	//echo $qry . mysql_error();
	// echo ('<select name="'.$field.'" size="1" '.$disable.'>');
	while ($row = bdd_my_fetch_row($result)) {
		if ($row[1]==$selected) {
			echo ('<option value="'.$row[1].'" selected>'.$row[0].'</option>');
		} else {
			echo ('<option value="'.$row[1].'">'.$row[0].'</option>');
		}
	}
	//echo ('</select>');
}


?>
