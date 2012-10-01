<?php
function filtro($val){
$cnx=bdd_conectar(); ?>
<div>
<button id="li1_<?php echo $val;?>a" onclick='filtro(this)'> <img src='filtro.gif'>  </button>
</div>
<div id="dialog1" class="yui-pe-content">
<div class="hd">Configure su Indicador</div>
<div class="bd">
<form method="POST" action="post.php"><?php
$q='SELECT region, departamento, municipio, establecimiento, codigo_area, sexo, sibasi FROM poblacion';
$rs = bdd_pg_query($cnx, $q);
$numf = pg_num_fields($rs);
$i = 0;
while ($i < $numf  ) {
        $meta = pg_field_name($rs,$i); 
        $fname = $meta;
        $campo[$i]=$fname;
        $q="SELECT DISTINCT ON (".$fname.") ".$fname." region from poblacion order by ".$fname; ?>
        <table>
            <TR class="frm-fld-x-odd">
                    <TD width="20%"><?php echo $fname; ?></TD>
                    <TD width="80%">
                            <select name="<?php echo $fname; ?>" size="1" id="<?php echo $fname; ?>">
                                    <option selected="selected"> [Seleccione Uno ..]</option>
                                    <?php llenarCmb($q, $cnx); ?>
                            </select>
                    </TD>
            </TR>
        </table><?php
$i++;
}?>
<label for="grupo">Agrupado por:</label><br /><?php
$i = 0;
while ($i < $numf  ) {?>
        <input type="radio" name="grupo[]" value="<?php echo $campo[$i]; ?>" checked/> <?php echo $campo[$i]; ?><br /><?php
        $i++;    
}?>
<label for="grupo1">Tipo de grafico:</label><br />
<input type="radio" name="grupo1[]" value="Barra" checked/> Barra<br />
<input type="radio" name="grupo1[]" value="Circulo" checked/> Circulo<br />

</form>
</div>
</div><?php 
}

function llenarCmb($q, $cnx){
	$result = bdd_pg_query($cnx,$q);
	while ($row = bdd_pg_fetch_row($result)) {
		echo ('<option value="'.$row[0].'" >'.$row[0].'</option>');
	}
}


?>
