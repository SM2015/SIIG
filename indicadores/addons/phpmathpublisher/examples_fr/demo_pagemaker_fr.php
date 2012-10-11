<html>
<head><meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>PhpMathPublisher : Demo Page Maker</title>
<meta name="keywords" content="mathematic,math,mathematics,mathématique,math renderer,php,formulae,latex,mathml,publishing,pascal brachet,brachet">
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<p align="center"><IMG src="header.gif" border="0"></p>
<div id="header">Démo : Création dynamique d'une page en ligne</div>
<div id="contentlabel">Description</div>
<div id="contentbox"><p>Le but de cette démonstration est de montrer comment on peut utiliser PhpMathPublisher pour créer des pages mathématiques en ligne. Le haut et le bas de page sont définis dans les fichiers "header.inc" et "footer.inc" dans le répertoire "files/". Le contenu de la page est créé dynamiquement par PhpMathPublisher à partir du texte entré ci-dessous. La page créée est alors affichée (en pop-up) pour vérification.<br>
<i>Remarque :</i> pour cette démo, le nom du fichier restera fixé à "tmp.html" pour ne pas encombrer le site de fichiers créés par les visiteurs <i>(s'il y a plusieurs connectés en même temps, il y aura une grosse pagaille dans ce fichier : il s'agit simplement de montrer ce qu'il est possible de faire et non pas de créer un vrai CMS)</i>.</p></div>
<div id="contentlabel">Entrée</div>
<div id="contentbox"><p>Taper votre texte, indiquer le nom du fichier html à créer, puis cliquer sur "Créer".<br>Vous pouvez aussi fixer la taille de la police utilisée pour les formules (et le texte).</p>
<p>Cliquer <A href="../doc_fr/help_fr.html" target="_blank">ici</A> pour voir la syntaxe mathématique à respecter.</p>
</div>
<div align="left">
<form name="forme1" method="GET" action="<? echo $_SERVER['PHP_SELF']; ?>">
<TEXTAREA NAME="message" COLS="80" ROWS="10">
<? echo stripslashes($HTTP_GET_VARS['message']); ?>
</TEXTAREA>
<p>
<input type="button" name="efface" value="Effacer" onclick="document.forme1.message.value='';">
&nbsp;&nbsp;
Taille :&nbsp;<input type="text" name="size" size="2" value="<? echo $HTTP_GET_VARS['size']; ?>">
&nbsp;&nbsp;
Nom du fichier à créer :&nbsp;<input type="texte" name="filename" size="20" value="<? echo $HTTP_GET_VARS['filename']; ?>">
&nbsp;&nbsp;<input type="submit" name="bouton" value="Créer">
</p>
</form>
<?
include("../mathpublisher.php") ;
$message=$HTTP_GET_VARS['message'];
$size=$HTTP_GET_VARS['size'];
//$filename=$HTTP_GET_VARS['filename'];
$filename="tmp.html";
$pathtofiles=$_SERVER["DOCUMENT_ROOT"]."/phpmathpublisher/files/";
$pathtoimg="../img/";
if ((!isset($size)) || $size<10) $size=14;
if ( isset($message) && $message!='' && isset($filename) && $filename!='' ) 
	{
	$headerfile=$pathtofiles."header.inc";
	$p=fopen($headerfile,"r");
	$header=fread($p,filesize($headerfile));
	fclose($p);
	$header=str_replace('font-size :;','font-size :'.$size.'pt;',$header);
	$footerfile=$pathtofiles."footer.inc";
	$p=fopen($footerfile,"r");
	$footer=fread($p,filesize($footerfile));
	fclose($p);
	$content=$header."<div>".mathfilter($message,$size,$pathtoimg)."</div>".$footer;
	$file=$pathtofiles.$filename;
	$p=fopen($file,"w");
	fputs($p,$content);
	fclose($p);
	echo ("<script>window.open('../files/".$filename."','','width=800,height=500,toolbar=yes,scrollbars=yes,resizeable=yes');</script>");
	}
?>
</div>
<div id="footer">
<p><A href="http://www.xm1math.net/phpmathpublisher/index_fr.html">PhpMathPublisher</A> - Copyright 2005 <b>Pascal Brachet - France</b> <br>
L'auteur est professeur de mathématiques au lycée Bernard Palissy à Agen.<br>
Ce programme est distribué selon les termes de la licence libre GPL.</p>
</div>
</body>
</html>
