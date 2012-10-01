<?php
include('../../addons/evalmath/evalmath.class.php');
$formula= (isset($_REQUEST['formula'])) ? $_REQUEST['formula'] : NULL;
	$m = new EvalMath;
	$m->suppress_errors = true;
	if ($m->evaluate('y(x) = ' . $formula)) {
		print "\t<table border=\"1\">\n";
		print "\t\t<tr><td><font size=3 color='#006600'>La sintaxis de la formula esta correcta</font></td></tr>\n";
		print "\t</table>\n";
	} else {
            	print "\t<table border=\"1\">\n";
		print "\t\t<tr><td><p><font size=3 color='red'>Error en la funcion: " . $m->last_error . "</font></p></td></tr>\n";
		print "\t</table>\n";
	}
?>
