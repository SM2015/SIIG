<?php
include_once("../../addons/general/general.php");
$cnx = bdd_conectar();
$txt = (isset($_REQUEST['img'])) ? $_REQUEST['img'] : NULL;

switch ($txt) {
    case 'li2_3ga':
           $q="select sibasi ,sum(cantidad) from poblacion  group by sibasi";
           $rs = bdd_pg_query($cnx, $q);
           include("../../../FusionChartsFree/Code/PHP/Includes/FusionCharts.php");
           $strXML = "<graph caption='Poblacion por SIBASI' xAxisName='Sibasis' showNames='1' yAxisName='Poblacion'
           decimalPrecision='0' formatNumberScale='0'>";
           while ($reg = bdd_pg_fetch_row($rs)) {
                    $strXML .= "<set name='".$reg[0]."' value='".$reg[1]."'/>";
           }
           $strXML .= "</graph>";
           print $strXML;
           echo renderChartHTML("../../../FusionChartsFree/Charts/FCF_Doughnut2D.swf", "", $strXML, "FactorySum", 800, 400);
    break;
    case 'li1_1ga':
           $q="select sibasi ,sum(cantidad) from poblacion  group by sibasi";
           $rs = bdd_pg_query($cnx, $q);
           include("../../../FusionChartsFree/Code/PHP/Includes/FusionCharts.php");
           $strXML = "<graph caption='Poblacion por SIBASI' xAxisName='SIBASI' yAxisName='Cantidad'
           decimalPrecision='0' formatNumberScale='0' >";
           while ($reg = bdd_pg_fetch_row($rs)) {
               $g_random=rand(1,9);
               switch ($g_random) {
                    case '1':   $color ="AFD8F8";  break;
                    case "2":   $color ="F6BD0F";  break;
                    case '3':   $color ="8BBA00";  break;
                    case "4":   $color ="FF8E46";  break;
                    case '5':   $color ="008E8E";  break;
                    case "6":   $color ="D64646";  break;
                    case '7':   $color ="8E468E";  break;
                    case "8":   $color ="588526";  break;
                    case '9':   $color ="B3AA00";  break;
                    case "10":   $color ="008ED6";  break;
              
                }
                    $strXML .= "<set name='".substr($reg[0], 6,7)."' value='".$reg[1]."'color='".$color."' />";
           }
           $strXML .= "</graph>";
           print $strXML;
           echo renderChartHTML("../../../FusionChartsFree/Charts/FCF_Column3D.swf", "", $strXML, "myNext", 700, 400);
    break;
    case 'li2_2ga':
           $q="select region ,sum(cantidad) from poblacion group by region";
           $rs = bdd_pg_query($cnx, $q);
           include("../../../FusionChartsFree/Code/PHP/Includes/FusionCharts.php");
           $strXML = "<graph caption='Poblacion por REGION' xAxisName='REGION' showNames='1' yAxisName='Poblacion'
           decimalPrecision='0' formatNumberScale='0'>";
           while ($reg = bdd_pg_fetch_row($rs)) {
                    $strXML .= "<set name='".$reg[0]."' value='".$reg[1]."'/>";
           }
           $strXML .= "</graph>";
           print $strXML;
           echo renderChartHTML("../../../FusionChartsFree/Charts/FCF_Doughnut2D.swf", "", $strXML, "FactorySum", 800, 400);
    break;
    case 'li1_2ga':
           $q="select region ,sum(cantidad) from poblacion group by region";
           $rs = bdd_pg_query($cnx, $q);
           include("../../../FusionChartsFree/Code/PHP/Includes/FusionCharts.php");
           $strXML = "<graph caption='Poblacion por REGION' xAxisName='REGION' yAxisName='Cantidad'
           decimalPrecision='0' formatNumberScale='0'>";
           while ($reg = bdd_pg_fetch_row($rs)) {
               $g_random=rand(1,9);
               switch ($g_random) {
                    case '1':   $color ="AFD8F8";  break;
                    case "2":   $color ="F6BD0F";  break;
                    case '3':   $color ="8BBA00";  break;
                    case "4":   $color ="FF8E46";  break;
                    case '5':   $color ="008E8E";  break;
                    case "6":   $color ="D64646";  break;
                    case '7':   $color ="8E468E";  break;
                    case "8":   $color ="588526";  break;
                    case '9':   $color ="B3AA00";  break;
                    case "10":   $color ="008ED6";  break;
              
                }
                    $strXML .= "<set name='".$reg[0]."' value='".$reg[1]."'color='".$color."'/>";
           }
           $strXML .= "</graph>";
           print $strXML;
           echo renderChartHTML("../../../FusionChartsFree/Charts/FCF_Column3D.swf", "", $strXML, "myNext", 700, 400);
    break;
    case 'li2_1ga':
           $q="select sexo ,sum(cantidad) from poblacion group by sexo";
           $rs = bdd_pg_query($cnx, $q);
           include("../../../FusionChartsFree/Code/PHP/Includes/FusionCharts.php");
           $strXML = "<graph caption='Poblacion por sexo' xAxisName='SEXO' showNames='1' yAxisName='Poblacion'
           decimalPrecision='0' formatNumberScale='0'>";
           while ($reg = bdd_pg_fetch_row($rs)) {
                    $strXML .= "<set name='".$reg[0]."' value='".$reg[1]."'/>";
           }
           $strXML .= "</graph>";
           print $strXML;
           echo renderChartHTML("../../../FusionChartsFree/Charts/FCF_Doughnut2D.swf", "", $strXML, "FactorySum", 800, 400);
    break;
    case 'li1_3ga':
           $q="select sexo ,sum(cantidad) from poblacion group by sexo";
           $rs = bdd_pg_query($cnx, $q);
           include("../../../FusionChartsFree/Code/PHP/Includes/FusionCharts.php");
           $strXML = "<graph caption='Poblacion por Sexo' xAxisName='SEXO' yAxisName='Cantidad'
           decimalPrecision='0' formatNumberScale='0'>";
           while ($reg = bdd_pg_fetch_row($rs)) {
               $g_random=rand(1,9);
               switch ($g_random) {
                    case '1':   $color ="AFD8F8";  break;
                    case "2":   $color ="F6BD0F";  break;
                    case '3':   $color ="8BBA00";  break;
                    case "4":   $color ="FF8E46";  break;
                    case '5':   $color ="008E8E";  break;
                    case "6":   $color ="D64646";  break;
                    case '7':   $color ="8E468E";  break;
                    case "8":   $color ="588526";  break;
                    case '9':   $color ="B3AA00";  break;
                    case "10":   $color ="008ED6";  break;
              
                }
                    $strXML .= "<set name='".$reg[0]."' value='".$reg[1]."'color='".$color."'/>";
           }
           $strXML .= "</graph>";
           print $strXML;
           echo renderChartHTML("../../../FusionChartsFree/Charts/FCF_Column3D.swf", "", $strXML, "myNext", 700, 400);
    break;
    default:
        print 'hola';
    break;
}

?>


