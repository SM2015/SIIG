<?php
session_start();
include_once("usuarios.php");
include_once("../addons/general/general.php");
include_once("../lib/menu.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="favicon.ico" type="image/x-icon" rel="shortcut icon" />
<script type="text/javascript" src="ajax2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="../addons/css/general.css">
<script type='text/javascript' src='../addons/js/jquery-latest.js'></script>
<script type="text/javascript" src="../addons/js/general.js"></script>
<script type="text/javascript" src="../addons/js/gen_validatorv2.js"></script>
<link rel="stylesheet" type="text/css" href="../addons/tables/stripy_tables.css">
<script language="JavaScript" type="text/javascript" src="../addons/tables/core.js"></script>
<script language="JavaScript" type="text/javascript" src="../addons/tables/stripy_tables.js"></script>
<link rel="stylesheet" type="text/css" href="../addons/chromemenu/chrometheme/chromestyle.css">
<script language="JavaScript1.5" type="text/javascript" src="../addons/chromemenu/chromejs/chrome.js"></script>
<link rel="stylesheet" type="text/css" href="../addons/yui1/build/reset-fonts-grids/reset-fonts-grids.css">
<link rel="stylesheet" type="text/css" href="../addons/css/frm-x.css">
<link rel="stylesheet" type="text/css" href="../addons/css/mspas.css">

    </head>
    <body>
        <table align="center" width="100%">
                <tr>
                        <td align="center">
                        <img src="../lib/logo_salud.png" width="800" height="90" />
                        </td>
                </tr>
        </table>
        <p align="right" ><a href="/indicadores/usuarios/index.php">Cerrar sesi&oacute;n</a></p>
<div id="doc4" class="yui-t7">
    <div id="hd">
        <div id="mspas-header">
             <div id="mspas-hd-menu">
                <p> <?php $tipo = (isset($_SESSION['tipo']))? $_SESSION['tipo'] : NULL; ?> </p>
            </div>
            <div id="bd" class="mspas-plantilla1">
		<div class="yui-u">
		  <p> <script language="JavaScript1.5" type="text/javascript" src="../addons/js/MPJSBackLinks.js"></script></p>
		</div>
                <div class="yui-u" id="mspas-contenido">
                  <?php
                   $sesion_valida = (isset($_SESSION['valida']))? $_SESSION['valida'] : '0';
                   echo usuarios_ingreso($sesion_valida);
		  ?>
                </div>
            </div>
            <div id="ft">
                <div id="mspas-footer">&copy; Ministerio de Salud P&uacute;blica y Asistencia Social - Unidad de Inform&aacute;tica|
                <a href="#">Pol&iacute;tica de privacidad</a> </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>








