<?php
include_once("../../addons/general/general.php");
$cnx = bdd_conectar();
$q="select sibasi ,sum(cantidad) from poblacion  group by sibasi";
$rs = bdd_pg_query($cnx, $q);
include("../../../FusionChartsFree/Code/PHP/Includes/FusionCharts.php");
   $strXML = "<graph caption='Poblaciones' xAxisName='Sibasis' showNames='1' yAxisName='Poblacion'
   decimalPrecision='0' formatNumberScale='0'>";
   while ($reg = bdd_pg_fetch_row($rs)) {
        $strXML .= "<set name='".$reg[0]."' value='".$reg[1]."'/>";
   }
$strXML .= "</graph>";
print $strXML;
echo renderChartHTML("../../../FusionChartsFree/Charts/FCF_Doughnut2D.swf", "", $strXML, "FactorySum", 800, 400);

?>


