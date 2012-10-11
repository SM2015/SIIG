<?php
function usuarios_validarSesion($sesion = NULL){
	// validamos la session
	return ($sesion!=1)? true : false;
}


function usuarios_ingreso($sesion_valida=NULL){
	if ($sesion_valida != NULL) { // si esta definido un valor para $sesion_valida
		if (usuarios_validarSesion($sesion_valida)) { // validar la sesion
			usuarios_mostrarFormularioIngreso();
		} else { // no ha ingresado
		}
	}
}


/**
 * Mostrar formulario de ingreso
 *
 */
function usuarios_mostrarFormularioIngreso() {
$_SESSION['uid'] = NULL;
$_SESSION['rol']=NULL;
?>

<h1>Ingreso de Usuarios</h1>
<form id="ingreso" name="ingreso" method="post" action="validar_usuario.php">
    <fieldset >
    <legend>campos marcados como <span class="required">resaltados</span> son requeridos </legend>
    <fieldset >
    <legend>Ingreso de credenciales</legend>
    <div class="frm-fld-x">
        <label for="user" class="required">Usuario</label>
        <input type="text" name="user" tabindex="1" id="textfield" />
    </div>
    <div class="frm-fld-x-odd">
        <label for="textfield2" class="required">Contrase&ntilde;a</label>
        <input type="password" name="textfield2" tabindex="2" id="label" />
    </div>
    </fieldset>
    <fieldset>
    <legend>Acciones</legend>
    <div class="frm-fld-x">
        <label for="Submit"> </label>
		<input type="hidden" name="token" value="<?php echo $token; ?>" />
        <input name="Submit" type="submit" class="frm-btn-x" id="Submit" tabindex="3" value="Ingresar" />
    </div>
    </fieldset>
    </fieldset>
</form>
<script>
	var frmvalidator = new Validator("ingreso");
	frmvalidator.addValidation("user","req","Usuario: campo requerido");
	frmvalidator.addValidation("textfield2","req","Contrase�a: campo requerido");
</script>
<?php
}

function usuario_validarUsuario($user, $code){
	$cnx = bdd_conectar();
	$q = "SELECT id_usuarios, usuario, clave, nombre, id_rol FROM usuarios where usuario='".$user.
                "' and clave=md5('".$code."')";
	$rs = bdd_pg_query($cnx, $q);
	$num = bdd_pg_num_rows($rs);

	if ($num == 1){ //usuario encontrado
		// construir sesion para usuario
		$datosUsuario = bdd_pg_fetch_row($rs);
		$_SESSION['uid'] = $datosUsuario[0]; // usuario id
		$_SESSION['usuario']= $datosUsuario[1]; // nombres del usuario
                $_SESSION['rol']= $datosUsuario[4];
		registrarUsuario();
		return true;
	}
	return false;
	$bdd_cerrar($cnx);
}

function registrarUsuario(){
	$cnx = bdd_conectar();
// builing sql stament
$ip=getIP();
$q = "INSERT INTO vitacora SET
usuario_id = ".$_SESSION['uid'].",
ip= '".$ip."',
fecha= now()";
$rs = bdd_pg_query($cnx, $q);
bdd_cerrar($cnx);
}

function getIP() {
    if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
       $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
    }
    elseif (isset($_SERVER['HTTP_VIA'])) {
       $ip = $_SERVER['HTTP_VIA'];
    }
    elseif (isset($_SERVER['REMOTE_ADDR'])) {
       $ip = $_SERVER['REMOTE_ADDR'];
    }
    else {
       $ip = "unknown";
    }

    return $ip;
}
?>
