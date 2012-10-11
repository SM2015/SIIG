<?php
function paginacion($url, 
										$total_items, 
										$per_page, 
										$start, 
										$range = 5, 
										$pages = 'total', 
										$prevnext = TRUE, 
										$prevnext_always = FALSE, 
										$firstlast = TRUE, $firstlast_always = FALSE) {
    $str_links = " <a href='%s'>%s</a> ";
    $str_selected = " <a href='%s'>[%s]</a> ";
    $str_prevnext = " <a href='%s'>%s</a> ";
    $str_firstlast = " <a href='%s'>%s</a> ";
    $str_pages = "%s ";
    $prev_txt = '&lt;%s';
    $next_txt = '%s&gt;';
    $first_txt = '&laquo;%s';
    $last_txt = '%s&raquo;';
    $pages_txt_total = '%s P&aacute;ginas';
    $pages_txt_page = 'P&aacute;gina %s';
    $pages_txt_pageoftotal = 'P&aacute;gina %s de %s <br>';
    $str = '';
    $total_items = ($total_items <= 0) ? 0 : $total_items;
    $per_page = ($per_page < 1) ? 1 : $per_page;
    $range = ($range < 1) ? 1 : $range;
    $sel_page = 1;
    $url = '?start=';
    $total_pages = ceil($total_items / $per_page);
	if ($total_pages > 1) {
	    $sel_page = floor($start / $per_page) + 1;
	    $range_min = ($range % 2 == 0) ? ($range / 2) - 1 : ($range - 1) / 2;
	    $range_max = ($range % 2 == 0) ? $range_min + 1 : $range_min;
	    $page_min = $sel_page - $range_min;
	    $page_max = $sel_page + $range_max;
            $page_min = ($page_min < 1) ? 1 : $page_min;
            $page_max = ($page_max < ($page_min + $range - 1)) ? $page_min + $range - 1 : $page_max;
        	if ($page_max > $total_pages) {
            		$page_min = ($page_min > 1) ? $total_pages - $range + 1 : 1;
            		$page_max = $total_pages;
        	}
	    for ($i = $page_min;$i <= $page_max;$i++) {
            	$str .= sprintf((($i == $sel_page) ? $str_selected : $str_links), $url . (($i - 1) * $per_page), $i);
	    }
	    if (($prevnext) || (($prevnext) && ($prevnext_always))) {
            	$prev_num = (($prevnext === 'num') || ($prevnext === 'nump')) ? $sel_page - 1 : '';
            	$next_num = (($prevnext === 'num') || ($prevnext === 'numn')) ? $sel_page + 1 : '';
            	$prev_txt = sprintf($prev_txt, $prev_num);
            	$next_txt = sprintf($next_txt, $next_num);
	        if (($sel_page > 1) || ($prevnext_always)) {
	            $start_at = ($sel_page - 2) * $per_page;
	            $start_at = ($start_at < 0) ? 0 : $start_at;
	            $str = sprintf($str_prevnext, $url . $start_at, $prev_txt).$str;
	        }
	        if (($sel_page < $total_pages) || ($prevnext_always)) {
	            $start_at = $sel_page * $per_page;
	            $start_at = ($start_at >= $total_items) ? $total_items - $per_page : $start_at;
	            $str .= sprintf($str_prevnext, $url . $start_at, $next_txt);
	        }
	    }
	    if (($firstlast) || (($firstlast) && ($firstlast_always))) {
            	$first_num = (($firstlast === 'num') || ($firstlast === 'numf')) ? 1 : '';
            	$last_num = (($firstlast === 'num') || ($firstlast === 'numl')) ? $total_pages : '';
            	$first_txt = sprintf($first_txt, $first_num);
            	$last_txt = sprintf($last_txt, $last_num);
	        if ((($sel_page > ($range - $range_min)) && ($total_pages > $range)) || ($firstlast_always)) {
	            $str = sprintf($str_firstlast, $url . '0', $first_txt).$str;
	        }
	        if ((($sel_page < ($total_pages - $range_max)) && ($total_pages > $range)) || ($firstlast_always)) {
	            $str .= sprintf($str_firstlast, $url . ($total_items - $per_page), $last_txt);
	        }

	    }
	} 
	if ($pages) {
		switch ($pages){
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
        	$str = sprintf($str_pages, $pages_txt) . $str;
    	}
    	return $total_items." ".$str;
} 

function general_fillCmb($table, $field, $id, $desc, $selected= NULL, $disable =NULL, $cnx){
        if($disable !=NULL){
            $qry ="SELECT ".$desc.", ".$id." FROM ".$table." WHERE ".$disable." ORDER BY ".$desc;
        }else{
            $qry ="SELECT ".$desc.", ".$id." FROM ".$table." ORDER BY ".$desc;
        }
	$result = bdd_pg_query($cnx,$qry);
	while ($row = bdd_pg_fetch_row($result)) {
		if ($row[1]==$selected) {
			echo ('<option value="'.$row[1].'" selected>'.$row[0].'</option>');
		} else {
			echo ('<option value="'.$row[1].'">'.$row[0].'</option>');
		}
	}
}

function general_sacarRegistroPorCondicion($tabla, $where, $cnx, $fields='*') {
	$q = "SELECT ".$fields." FROM ".$tabla." 
	WHERE ".$where." LIMIT 1";
	$rs = bdd_pg_query($cnx, $q);
	$r = bdd_pg_fetch_row($rs);
	return $r;
}
//pg
function bdd_conectar() {
@define('PGHOST','localhost');
@define('PGPORT',5432);
@define('PGDATABASE','indicadores');
@define('PGUSER', 'admin');
@define('PGPASSWORD', 'rodriguez');
@define('PGCLIENTENCODING','utf8');
@define('ERROR_ON_CONNECT_FAILED',' No se puede conectar con el servidor de DB ahora!');
$str='host=' . PGHOST . ' port=' . PGPORT . ' dbname=' . PGDATABASE . ' user=' . PGUSER . ' password=' . PGPASSWORD ;
$link= pg_pconnect($str);
	return $link;
}

function bdd_pg_query($link, $q, $resultmode=NULL){
	return pg_query($link, $q); 
}

function bdd_pg_num_rows($rs){
	return pg_num_rows($rs);
}

function bdd_pg_fetch_row($rs){
	return pg_fetch_row($rs);
}

function bdd_pg_affected_rows($rs1){
	return pg_affected_rows($rs1);
}

function bdd_cerrar($link){
	pg_close($link);
}

function encriptar_clave($valor){
    $clave = md5('111');
    $tama_iv = mcrypt_enc_get_iv_size(40);
    $iv = mcrypt_create_iv($tama_iv,MCRYPT_RAND);
    $texto = $valor;
    $texto_cifrado = mcrypt_encrypt(MCRYPT_DES,$clave,$texto,MCRYPT_MODE_ECB,$iv);

    return utf8_encode($texto_cifrado);

}

function decriptar_clave($valor){
    $clave = md5('111');
    $tama_iv = mcrypt_enc_get_iv_size(40);
    $iv = mcrypt_create_iv($tama_iv,MCRYPT_RAND);
    $texto = $valor;
    $texto_cifrado = mcrypt_decrypt(MCRYPT_DES,$clave,$texto,MCRYPT_MODE_ECB,$iv);

    return $texto_cifrado;

}



//mysql
function bdd_seleccionarBDD($link, $bdd){
	mysqli_select_db($link, $bdd);
}





function bdd_pg_error($cnx){
	return pg_error($cnx);
}
?>