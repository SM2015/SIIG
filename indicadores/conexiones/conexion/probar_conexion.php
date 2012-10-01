<?php 
$nombre= 	(isset($_REQUEST['nombre_conexion'])) ? $_REQUEST['nombre_conexion'] : NULL;
$motor= 	(isset($_REQUEST['Motor'])) ? $_REQUEST['Motor'] : NULL;
$ip=		(isset($_REQUEST['Ip'])) ? $_REQUEST['Ip'] : NULL;
$port=		(isset($_REQUEST['Puerto'])) ? $_REQUEST['Puerto'] : NULL;
$instancia=	(isset($_REQUEST['Instancia'])) ? $_REQUEST['Instancia'] : NULL;
$base=		(isset($_REQUEST['Base'])) ? $_REQUEST['Base'] : NULL;
$usuario=	(isset($_REQUEST['Usuario'])) ? $_REQUEST['Usuario'] : NULL;
$clave=		(isset($_REQUEST['Clave'])) ? $_REQUEST['Clave'] : NULL;

if ($ip== '127.0.0.0'){
	$ip="localhost";
}
if ($instancia!=""){
	$ip=$ip."\ ".$instancia;
	$ip= ereg_replace( "([     ]+)", "", $ip ); 
}
define('PGHOST',$ip);
define('PGPORT',$port);
define('PGDATABASE',$base);
define('PGUSER', $usuario);
define('PGPASSWORD', $clave);
define('PGCLIENTENCODING','utf8');
define('ERROR_ON_CONNECT_FAILED',' No se puede conectar con el servidor de DB ahora!');
			switch ($motor) {
				case 1:
					$link = @mysqli_connect(PGHOST, PGUSER, PGPASSWORD, PGDATABASE) or die ("<p class='colorr'>conexion Fallida</p>");
					if($link){
						print "<p class='colorv'>conexion exitosa</p>";
	    					exit();
					} 


				break;
				case 2:
					$str='host=' . PGHOST . ' port=' . PGPORT . ' dbname=' . PGDATABASE . ' user=' . PGUSER . ' password=' . PGPASSWORD ;
					//$link= pg_pconnect($str);
					if (($link = @pg_pconnect($str))== false){
	   					print "<p class='colorr'>conexion Fallida</p>";
	    					exit();
					}else{
	   					print "<p class='colorv'>conexion exitosa</p>";
	    					pg_close($link);
						exit();
					}

				break;
				case 3:

					if (($link = @mssql_connect(PGHOST,PGUSER,PGPASSWORD))== false){
	   					print "<p class='colorr'>conexion Fallida</p>";
	    					exit();
					}else{
	   					print "<p class='colorv'>conexion exitosa</p>";
	    					mssql_close($link);
						exit();
					}
				break;
			}
?>