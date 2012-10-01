<html>
<head><meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>PhpMathPublisher : Demo Conversion</title>
<meta name="keywords" content="mathematic,math,mathematics,mathématique,math renderer,php,formulae,latex,mathml,publishing,pascal brachet,brachet">
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<p align="center"><IMG src="header.gif" border="0"></p>
<div id="header">Démo : Math - Html conversion</div>
<div id="contentlabel">Description</div>
<div id="contentbox"><p>This demo shows you how PhpMathPublisher works.<br>From the text entered below, PhpMathPublisher will create the pictures corresponding to the formulas (in the "/img" directory) and will return the html code displayed below.<br>The code can be used to create a static page.<br> For a real work, you must indicate the relative path between your html page and the "img/" directory.
</p></div>
<div id="contentlabel">Input</div>
<div id="contentbox"><p>Type your text and click on "Convert"</p>
<p>Click <A href="../doc/help.html" target="_blank">here</A> to see the mathematical syntax to respect.</p></div>
<div align="left">
<form name="forme1" method="GET" action="<? echo $_SERVER['PHP_SELF'];?>">
<TEXTAREA NAME="message" COLS="80" ROWS="10">
<?  echo stripslashes($HTTP_GET_VARS['message']); ?>
</TEXTAREA>
<p>
<input type="button" name="efface" value="Delete" onclick="document.forme1.message.value='';">
&nbsp;&nbsp;Size :&nbsp;
<input type="text" name="size" size="2" value="<?  echo $HTTP_GET_VARS['size']; ?>">
&nbsp;&nbsp;Path to img/ :&nbsp;
<input type="text" name="pathtoimg" size="10" value="<? echo $HTTP_GET_VARS['pathtoimg']; ?>">
&nbsp;&nbsp;<input type="submit" name="bouton" value="Convert">
</p>
</form>
</div>
<div id="contentlabel">Result</div>
<div id="contentbox"><p>Html code created by PhpMathPublisher:</p></div>
<div align="left">
<form name="forme2">
<TEXTAREA NAME="resultat" COLS="80" ROWS="10">
<?
include("../mathpublisher.php") ;
$message=$HTTP_GET_VARS['message'];
$size=$HTTP_GET_VARS['size'];
$pathtoimg=$HTTP_GET_VARS['pathtoimg'];
if (!isset($pathtoimg)) $pathtoimg="img/";
if ((!isset($size)) || $size<10) $size=14;
if ( isset($message) && $message!='' ) 
	{
	echo(mathfilter($message,$size,$pathtoimg));
	}
?>
</TEXTAREA>
</div>
<div id="footer">
<p><A href="http://www.xm1math.net/phpmathpublisher/">PhpMathPublisher</A> - Copyright 2005 <b>Pascal Brachet - France</b> <br>The author is a teacher of mathematics in a French secondary school (Lycée Bernard Palissy - Agen).<br>
This program is licensed to you under the terms of the GNU General Public License Version 2 as published by the Free Software Foundation.</p>
</div>
</body>
</html>

