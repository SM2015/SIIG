<?php 
include_once("../../addons/general/general.php");
$cnx=bdd_conectar();
$id = (isset($_REQUEST['id'])) ? $_REQUEST['id'] : '%';
$text='grupo'.trim($id);
?>
<select name="<?php print $text;?>" tabindex="2" size="1" id="<?php print $text;?>">
        <option value="0" selected="selected"> Edades Simples</option>
        <?php general_fillCmbxx('grupos_etarios', 'id_grupo', 'id_grupo', 'descripcion', NULL, NULL, $cnx); ?>
</select>

<?php
function general_fillCmbxx($table, $field, $id, $desc, $selected= NULL, $disable =NULL, $cnx){
        $qry ="SELECT ".$desc.", ".$id." FROM ".$table." ORDER BY ".$id;
	$result = bdd_pg_query($cnx,$qry);
	while ($row = bdd_pg_fetch_row($result)) {
		if ($row[1]==$selected) {
			echo ('<option value="'.$row[1].'" selected>'.$row[0].'</option>');
		} else {
			echo ('<option value="'.$row[1].'">'.$row[0].'</option>');
		}
	}
}
