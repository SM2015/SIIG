<html>
<head><meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>PhpMathPublisher : Online demo</title>
<meta name="keywords" content="mathematic,math,mathematics,mathématique,math renderer,php,formulae,latex,mathml,publishing,pascal brachet,brachet">
<link rel="stylesheet" type="text/css" href="style.css">
<SCRIPT LANGUAGE="javascript">
formule = new Array();
formule[0]="Exemples";
formule[1]="<p>Une formule : <m>delim{|}{{1/N} sum{n=1}{N}{gamma(u_n)} - 1/{2 pi} int{0}{2 pi}{gamma(t) dt}}{|} <= varepsilon/3</m></p><b>A propos de pi :</b><ul><li><m>pi=sum{n=0}{+infty}{{(n!)^2 2^{n+1}}/{(2n+1)!}}</m></li><li><m>pi=22/7-int{0}{1}{{x^4 (1-x)^4}/{1+x^2}dx}</m></li><li><m>pi=3/4 sqrt{3}+24 int{0}{1/4}{sqrt{x-x^2}dx}</m></li></ul><p><m>delim{lbrace}{matrix{3}{1}{{3x-5y+z=0} {sqrt{2}x-7y+8z=0} {x-8y+9z=0}}}{~}</m>&nbsp;&nbsp;<m>delim{|}{matrix{3}{3}{a_{1 1} cdots a_{1 n} vdots ddots vdots a_{n 1} cdots a_{n n}}}{|}</m></p>";
formule[2]="<h2>Suites :</h2><p><b>Définition :</b> <m>(u_{n})_{n in bbN}</m> converge vers <m>l ~ doubleleftright ~ forall epsilon>0, exists p in bbN  ~ backslash ~ forall n>=p delim{|}{u_{n}-l}{|}<=epsilon</m><br><i>Remarque :</i> dans le cas d'une suite vectorielle, il suffit de remplacer <m>delim{|}{u_{n}-l}{|}</m> par <m>delim{vert}{u_{n}-l}{vert}</m><h2>Taylor avec reste intégral :</h2>Si <m>f</m> est de classe <m>C^{n+1}</m> sur l'intervalle, <m>f(x)=f(0)+xf{prime}(0)+{x^{2}}/{2!}f{prime prime}(0)+...+{x^{n}}/{n!}f^{n}(0)+int{0}{x}{{(x-t)^{n}}/{n!}f^{(n+1)}(t)dt}</m><h2>Série de Fourier</h2><b>Définition :</b> On appelle série de Fourier de <m>f</m> la série : <m>S(f)(t)=a_{0}+sum{n=1}{+infty}{a_{n} cos(n omega t)+b_{n} sin(n omega t)}</m> avec <m>omega={2pi}/{T}</m>";
formule[3]="<h1>Exemples divers et variés :</h1><i>Résolution</i> de <m>ax^2+bx+c=0</m> (<m>a<>0</m>) :<br>Si <m>Delta>0</m> , on a deux racines : <m>x_1={-b-sqrt{Delta}}/{2a}</m> et <m>x_2={-b+sqrt{Delta}}/{2a}</m><br>Soient <m>f</m> et <m>g</m> définies sur <m>delim{[}{1/2,+ infty}{[}</m> par <m>f(x)={4x^2+3x+1}/{2x-1}</m> et <m>g(x)=1/sqrt{f(x)}</m>.<br><m>lim{x right + infty}{f(x)}=lim{x right + infty}{{4x^2}/{2x}}=lim{x right + infty}{2x}=+ infty</m><br><m>x<4</m> ; <m>gamma<=8</m> ; <m>lambda>3</m> ; <m>Omega>=beta/2</m> ; <m>theta<>0</m> <m>Psi in delim{[}{e^{-{3pi}/5},sqrt{sqrt{3}/2}}{]}</m><br><m>t in bbR</m> ; <m>n in bbN</m> ; <m>2/3 notin bbZ</m> ; <m>1+sqrt{2}i in bbC</m> ; <m>bbZ subset bbR</m> ; <m>delim{]}{-infty;0}{[} inter delim{[}{1/2;+infty}{[}=varnothing</m>";
function choisir(n)
{
document.forme1.message.value=formule[n];
}
</SCRIPT>
</head>
<body>
<p align="center"><IMG src="header.gif" border="0"></p>
<div id="header">Démo en ligne</div>
<div id="contentlabel">Essai en ligne</div>
<div id="contentbox"><p>Sélectionner un exemple ou taper votre propre texte, puis cliquer sur "Afficher" : le résultat s'affichera alors ci-dessous .</p>
<p>Cliquer <A href="../doc_fr/help_fr.html" target="_blank">ici</A> pour voir la syntaxe mathématique à respecter.</p>
</div>
<div align="left">
<form name="forme1" method="GET" action="<? echo $_SERVER['PHP_SELF']; ?>">
<TEXTAREA NAME="message" COLS="80" ROWS="10">
<? echo stripslashes($HTTP_GET_VARS['message']); ?>
</TEXTAREA>
<p>
<input type="button" name="efface" value="Effacer" onclick="document.forme1.message.value='';">
&nbsp;&nbsp;Taille :&nbsp;
<input type="text" name="size" size="2" value="<? echo $HTTP_GET_VARS['size']; ?>">
&nbsp;&nbsp;
<SELECT NAME="choix" onChange="choisir(this.selectedIndex)">
<OPTION >Exemples
<OPTION >Exemple 1
<OPTION >Exemple 2
<OPTION >Exemple 3
</SELECT>
&nbsp;&nbsp;<input type="submit" name="bouton" value="Afficher">
</p>
</form>
</div>
<div id="contentlabel">Résultat</div>
<?
include("../mathpublisher.php") ;
$message=$HTTP_GET_VARS['message'];
$size=$HTTP_GET_VARS['size'];
if ((!isset($size)) || $size<10) $size=14;
if ( isset($message) && $message!='' ) 
	{
	echo("<div style=\"font-family : 'Times New Roman',times,serif ; font-size :{$size}pt;\">".mathfilter($message,$size,"../img/")."</div>");
	}
?>
<div id="footer">
<p><A href="http://www.xm1math.net/phpmathpublisher/index_fr.html">PhpMathPublisher</A> - Copyright 2005 <b>Pascal Brachet - France</b> <br>
L'auteur est professeur de mathématiques au lycée Bernard Palissy à Agen.<br>
Ce programme est distribué selon les termes de la licence libre GPL.</p>
</div>
</body>
</html>
