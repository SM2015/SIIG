<?php
include_once("sentencia.php");
include_once("../../addons/general/general.php");
$conexion= 	(isset($_REQUEST['Conexion'])) ? $_REQUEST['Conexion'] : NULL;
$nombre= 	(isset($_REQUEST['Nombre'])) ? $_REQUEST['Nombre'] : NULL;
$sentencia=		(isset($_REQUEST['Sentencia'])) ? $_REQUEST['Sentencia'] : NULL;
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
		$ip=$reg[3];
		if ($ip== '127.0.0.0'){
			$ip="localhost";
		}
		if ($reg[2]!=""){
			$ip=$ip."\ ".$reg[2];
			$ip= ereg_replace( "([     ]+)", "", $ip ); 
		}
		define('PPGHOST',$ip);
		define('PPGPORT',$reg[1]);
		define('PPGDATABASE',$reg[6]);
		define('PPGUSER',$reg[4]);
		define('PPGPASSWORD', $reg[5]);
		define('PPGCLIENTENCODING','utf8');
		//define('ERROR_ON_CONNECT_FAILED',' No se puede conectar con el servidor de DB ahora!');
		$motor=$reg[0];
	}else{
		print 'Problemas con la conexion';
	}

			switch ($motor) {
				case 1:
					$linkmysql = mysqli_connect(PPGHOST, PPGUSER, PPGPASSWORD, PPGDATABASE);
					$rsmysql = mysqli_query($linkmysql,$sentencia);
					$regp=	mysqli_fetch_row($rsmysql);
					$numf = mysqli_num_fields($rsmysql);
				break;
				case 2:
					$str='host=' . PPGHOST . ' port=' . PPGPORT . ' dbname=' . PPGDATABASE . ' user=' . PPGUSER . ' password=' . PPGPASSWORD ;
					$linkpg = pg_pconnect($str);
					$rspg=pg_query($linkpg, $sentencia);
					$repg=pg_fetch_row($rspg);
					$numf=pg_num_fields($rspg);

				break;
				case 3:
					$linkms = mssql_connect(PPGHOST,PPGUSER,PPGPASSWORD);
					mssql_select_db(PPGDATABASE,$linkms);
					$rsms= mssql_query($sentencia,$linkms);
					$rems = mssql_fetch_array( $rsms );
					$numf= mssql_num_fields($rsms);
				break;
			}

?>
			<table >
  			<thead>
    			<?php
			?>
    			<tr>
      			<?php
			$e = 0;
			
			while ($e < $numf  ) {
				switch ($motor) {
					case 1:
						$meta = mysqli_fetch_field($rsmysql); 
						$fname = $meta->name;
					break;
					case 2:
						$meta = pg_field_name($rspg,$i); 
						$fname = $meta;
					break;
					case 3:
						$meta = mssql_fetch_field($rsms); 
						$fname = $meta->name;
					break; 
				}

				
				
				?>
				<th><?php echo $fname; ?></th>
      				<?php
				$e++;
			} 


			?>
    			</tr>
 			</thead>
			<tbody>
    			<?php
				switch ($motor) {
					case 1:
						while ($reg = mysqli_fetch_row($rsmysql)) {
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
								
					break;
					case 2:
						while ($reg = pg_fetch_row($rspg)) {
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
						pg_close($linkpg);
						
					break;
					case 3:
						while ($reg = mssql_fetch_row($rsms)) {
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
						mssql_close($linkms);	
					break; 
				}
			

?>