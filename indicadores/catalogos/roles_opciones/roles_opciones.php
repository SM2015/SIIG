<?php

function asociar($id){
$cnx = bdd_conectar();
   $q = 'SELECT rol from roles where id_rol='.$id;
   $rs = bdd_pg_query($cnx, $q); 
   $reg = bdd_pg_fetch_row($rs);
   print "<h3><p><font color='#990000'> Rol --> ".$reg[0]."</font></p></h3>";
   $q = 'SELECT id_menu, nombre, id_padre FROM opciones_menu where publicado=1 and id_padre=0 order by nombre';
   $rs = bdd_pg_query($cnx, $q); ?>
<form action="<?php echo $_SERVER['PHP_SELF']?>?action=guardarnuevo" method="POST" id="add" name="add">
<fieldset ><legend> Asociar Opciones de Menu a Roles</legend>
    <div align="center">
    <input type="hidden" name="rol" id="rol" value="<?php echo $id; ?>" />
   <table border="1" >
       <tr><?php
           while ($reg = bdd_pg_fetch_row($rs)) {
               print "<td id='".$reg[0]."' onclick='opciones(this);'  onmouseover='color1(this);' onmouseout='color2(this);'>".$reg[1]."</td>";
           } ?>
       </tr>
   </table>
<div id="resultado"></div>
<script language="JavaScript" type="text/javascript">

</script>
</div>
    </fieldset >
</form>
<?php
}

function actualizar(){
    $opciones =(isset($_POST['variable'])) ? $_POST['variable'] : "";
    print 'hola--> '.$opciones[0];
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


?>
