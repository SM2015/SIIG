<?php 
function menu($tipo){
$cnx=bdd_conectar();
$t=1;

	switch ($t) {
		case 2 :
		break;
		case 3 :
		break;
	        case 4 :
	        break;
		case 1 :
			?>
			<div class="chromestyle" id="chromemenu">
				<ul>
                                    <?php
                                    $q="SELECT o.id_menu, o.nombre, o.id_padre, o.ruta, o.publicado, ro.id_rol FROM opciones_menu as o, roles_opciones as ro
                                    WHERE o.id_menu = ro.id_opcion and id_padre=0 and publicado=1 and ro.id_rol=".$tipo." order by nombre DESC ";
                                    $rs = bdd_pg_query($cnx, $q);
                                    $num = bdd_pg_num_rows($rs);
                                    $i=0;
                                    while ($reg = bdd_pg_fetch_row($rs)){
                                        $mp[$i]=$reg[0];
                                        ?>
                                        <li><a href="<?php echo $reg[3]; ?> " rel="dropmenu<?php echo $i; ?>"> <?php echo $reg[1]; ?> </a></li>  <?php
                                        $i++;
                                    }?>
                                </ul>
			</div> <?php
                                for ($t=0; $t<= $num-1; $t++){
                                    $q="SELECT o.id_menu, o.nombre,o.id_padre, o.ruta, o.publicado, ro.id_rol FROM   opciones_menu as o, roles_opciones as ro
                                        WHERE o.id_menu = ro.id_opcion and id_padre <> 0 and publicado=1 and id_padre=".$mp[$t]." and ro.id_rol=".$tipo." order by id_padre";
                                       $rs = bdd_pg_query($cnx, $q); ?>
                                    <div id="dropmenu<?php echo $t; ?>" class="dropmenudiv" style="width: 150px;"> <?php
                                        while ($reg = bdd_pg_fetch_row($rs)){ ?>
                                            <a href="<?php echo $reg[3];?>"><?php echo $reg[1];?></a> <?php
                                        } ?>
                                        </div>  <?php
                                }?>
                        <script type="text/javascript">
				cssdropdown.startchrome("chromemenu");
			</script>
			<?php
                      
		break;
		default:
			?>
			<div class="chromestyle" id="chromemenu">
			</div>
			<p>
			<?php
		break;
	}
}
?>
