<html>
<head><meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>PhpMathPublisher : Demo Conversion</title>
<meta name="keywords" content="mathematic,math,mathematics,mathématique,math renderer,php,formulae,latex,mathml,publishing,pascal brachet,brachet">
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<p align="center"><IMG src="header.gif" border="0"></p>
<div id="header">Démo : conversion Math - Html</div>
<div id="contentlabel">Description</div>
<div id="contentbox"><p>Le but de cette page est de montrer comment on peut utiliser PhpMathPublisher pour créer des pages de façon statique.<br>A partir du texte entré ci-dessous, PhpMathPublisher va créer les images correspondantes aux formules dans le répertoire "/img" (sur le serveur) et afficher le code html correspondant.<br>L'utilisateur n'a plus qu'à copier ce code pour créer sa page chez lui avant de la transférer sur son site.<br> Pour que cela fonctionne, il faut donner le chemin relatif entre la page que l'on souhaite créer et le répertoire "img/".
</p></div>
<div id="contentlabel">Entrée</div>
<div id="contentbox"><p>Taper votre texte, puis cliquer sur "Convertir".<br>Vous pouvez fixer la taille de la police utilisée pour les formules.<br><b>Remarque :</b> Il faut aussi fixer le chemin <b>relatif</b> entre la page web et le répertoire img/ où sont stockées les images des formules sur le serveur.</p>
<p>Cliquer <A href="../doc_fr/help_fr.html" target="_blank">ici</A> pour voir la syntaxe mathématique à respecter.</p>
</div>
<div align="left">
<form name="forme1" method="GET" action="<? echo $_SERVER['PHP_SELF']?>">
<TEXTAREA NAME="message" COLS="80" ROWS="10">
<? echo stripslashes($HTTP_GET_VARS['message']); ?>
</TEXTAREA>
<p>
<input type="button" name="efface" value="Effacer" onclick="document.forme1.message.value='';">
&nbsp;&nbsp;Taille :&nbsp;
<input type="text" name="size" size="2" value="<? echo $HTTP_GET_VARS['size']; ?>">
&nbsp;&nbsp;Chemin vers img/ :&nbsp;
<input type="text" name="pathtoimg" size="10" value="<? echo $HTTP_GET_VARS['pathtoimg']; ?>">
&nbsp;&nbsp;<input type="submit" name="bouton" value="Convertir">
</p>
</form>
</div>
<div id="contentlabel">Résultat</div>
<div id="contentbox"><p>Ici s'affiche le code html généré par PhpMathPublisher.</p></div>
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
<p><A href="http://www.xm1math.net/phpmathpublisher/index_fr.html">PhpMathPublisher</A> - Copyright 2005 <b>Pascal Brachet - France</b> <br>
L'auteur est professeur de mathématiques au lycée Bernard Palissy à Agen.<br>
Ce programme est distribué selon les termes de la licence libre GPL.</p>
</div>
</body>
</html>
