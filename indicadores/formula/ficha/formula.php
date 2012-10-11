<?php
include("../../addons/phpmathpublisher/mathpublisher.php") ;
$message= (isset($_REQUEST['formula'])) ? $_REQUEST['formula'] : NULL;
$message= '<m>'.$message.'</m>';
if ( isset($message) && $message!='' ) 
	{
	echo("<div style=\"font-family : 'Times New Roman',times,serif ; font-size :{15}pt;\">".mathfilter($message,15,"../../addons/phpmathpublisher/img/")."</div>");
	}
?>