<?php
require_once ('../../addons/jpg/src/jpgraph.php');
include_once("../../addons/general/general.php");
include_once("indicadores.php");
print "<form>";
$condicion=" where ";
foreach($_POST as $key => $value) {
        if (gettype($value) == "array") {
		for ($i = 0;$i < count($_POST[$key]);$i++) { 
                      if($key != 'grupo1'){
                       $v = $_POST[$key][$i];
                       $campo= "$v";
                      }else{
                          $v = $_POST[$key][$i];
                          $tipo= "$v";
                      }
		} 
	} else {
if($key != 'grupo' and $value != '[Seleccione Uno ..]' and $key != 'grupo1' ){
            $condicion=$condicion.$key." = '"."$value"."' and ";
}
	}
	print "</li>";
}
$tm=strlen($condicion);
$cnx = bdd_conectar();
$condicion = substr($condicion, 0, $tm-4);
$q="select ".$campo." ,sum(cantidad) from poblacion ".$condicion." group by ".$campo;
$q = str_replace(" wh "," ",$q);
$rs = bdd_pg_query($cnx, $q);
$i=0;
while ($reg = bdd_pg_fetch_row($rs)) {
    $datay[$i]=$reg[1];
    $datax[$i]=$reg[0];
    $i++;
}
// Setup the graph.
if($tipo=='Barra'){
    require_once ('../../addons/jpg/src/jpgraph_bar.php');
    $graph = new Graph(400,240);
    $graph->img->SetMargin(60,20,35,75);
    $graph->SetScale("textlin");
    $graph->SetMarginColor("lightblue:1.1");
    $graph->SetShadow();
    // Set up the title for the graph
    $graph->title->Set("Poblacion");
    $graph->title->SetMargin(8);
    $graph->title->SetFont(FF_VERDANA,FS_BOLD,12);
    $graph->title->SetColor("darkred");
    // Setup font for axis
    $graph->xaxis->SetFont(FF_VERDANA,FS_NORMAL,6);
    $graph->yaxis->SetFont(FF_VERDANA,FS_NORMAL,6);
    // Show 0 label on Y-axis (default is not to show)
    $graph->yscale->ticks->SupressZeroLabel(false);
    // Setup X-axis labels
    $graph->xaxis->SetTickLabels($datax);
    $graph->xaxis->SetLabelAngle(50);
    // Create the bar pot
    $bplot = new BarPlot($datay);
    $bplot->SetWidth(0.6);
    // Setup color for gradient fill style
    $bplot->SetFillGradient("navy:0.9","navy:1.85",GRAD_LEFT_REFLECTION);
    // Set color for the frame of each bar
    $bplot->SetColor("white");
    $graph->Add($bplot);
}else{

    
    require_once ('../../addons/jpg/src/jpgraph_pie.php');
    require_once ('../../addons/jpg/src/jpgraph_pie3d.php');

    $data = $datay;
    // Create the Pie Graph.
    $graph = new PieGraph(350,300);
    $graph->SetShadow();
    // Set A title for the plot
    $graph->title->Set("Poblacion");
    $graph->title->SetFont(FF_FONT1,FS_BOLD);
    // Create plots
    $size=0.22;
    $p1 = new PiePlot3D($data);
    $p1 ->SetAngle(80);
    $p1->SetLegends($datax);
    $p1->SetSize($size);
    $p1->SetCenter(0.25,0.60);
    $p1->value->SetFont(FF_FONT0);
    $graph->Add($p1);
}
// Finally send the graph to the browser
$graph->Stroke('tem.png'); ?>
<a href="#" id="tem" onClick="graficog(this)" > <img   src="tem.png" width="400" height="190" />  </a>
 <?php
    print "</form>";