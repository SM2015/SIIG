<?php
//seguridad
session_start();

// includes
include_once("../lib/general.php");

// Unset all of the session variables.
//$pais = $_SESSION['pais'];
session_unset();
//$_SESSION['pais'] = $pais;

// Finally, destroy the session.
//session_destroy();

echo "<script>document.location.href='".site_url."/usuarios'</script>";
?>
