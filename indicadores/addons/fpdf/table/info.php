<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
<title>Table (Fpdf Add On)</title>
<link href="info.css" rel="stylesheet" type="text/css">
</head>
<body>
<h2>Table (Fpdf Add On)</h2>
<h4 class="title1">Informations:</h4>
<blockquote>
Author: <A HREF="mailto:andy@interpid.eu">Bintintan Andrei, Interpid Team</A>
<br>
</blockquote>
<h4 class="title1">License:</h4>
<blockquote>
<?php echo nl2br(file_get_contents('license_short.txt'));?>
</blockquote>
<h4 class="title1">Description:</h4>
<blockquote>
This <a href="http://www.fpdf.org">FPDF</a> Add On Class allows the creation of complex <b>TABLES</b> in the pdf document<br>
</blockquote>
<h4 class="title1">Features:</h4>
<ul>
	<li>Every Cell from the Table is a fully featured Tag Based Multicell Object</li>
	<li>The cells can be vertically and horizontally aligned</li>
	<li>The header can be printed automatically on every new page</li>
	<li>A common definition style can be defined for rows and headers, which can be overriden for every cell by specific settings</li>
	<li>Columns can be spanned</li>
	<li>Rows can be spanned</li>
	<li>If the table reaches the end of the page it is automatically splitted</li>
	<br><br>
	<b>Please see the examples for more details.</b>
</ul>
<br>
<h4 class="title1">Table, Headers and Cell properties Example:</h4>
<blockquote>
<div class='codediv'>
<?php 
	highlight_file("table_def_ex.inc");
?>
</div>
</blockquote>
<h4 class="title1">Example:</h4>
<blockquote>
<b>Source Code:</b>
<div class='codediv'>
<?php 
	highlight_file("example_base.php");
?>
</div>
<br>
<b>View the result <a target="_blank" href="table_example_base.pdf">here</a></b>
<br>
<br>
<b><a target="_blank" href="table_example_detailed.pdf">Other example</a></b>
</blockquote>
</body>
</html>
