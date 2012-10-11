<?php
include_once("../../addons/general/general.php");
$cnx = bdd_conectar();
$txt = (isset($_REQUEST['img'])) ? $_REQUEST['img'] : NULL;
$uid  = (isset($_REQUEST['uid'])) ? $_REQUEST['uid'] : NULL;
$texa = explode("_",$txt);
if ($texa[1]<500){
    $q="SELECT id_usuario, id_indicador, temporal, seriex, seriey, tipop FROM series where tem=".$texa[1].' and id_usuario= '.$uid.' limit 1';
    $texa[1]=$texa[1]-100;
    $ind= substr($texa[1],0,2);
}else{
    $q="SELECT id_usuario, id_indicador, temporal, seriex, seriey, tipop FROM series where tem=".$texa[1].' and id_usuario= '.$uid.' limit 1';
    $texa[1]=$texa[1]-500;
    $ind= substr($texa[1],0,2);
}
$rs= bdd_pg_query($cnx, $q);
$reg = bdd_pg_fetch_row($rs);
$seriex = str_replace("{","",$reg[3]);
$seriex = str_replace(",",",",$seriex);
$seriex = str_replace("}","",$seriex);
$seriey = str_replace("{","",$reg[4]);
$seriey = str_replace("}","",$seriey);
$sx= explode(",",$seriex);
$sy= explode(",",$seriey);
$tipo=$reg[5];
$cant_var=sizeof($sx);
$qt="SELECT nombre FROM ficha_tecnica where id_ficha_tecnica=".$reg[1];
$rst= bdd_pg_query($cnx, $qt);
$regt = bdd_pg_fetch_row($rst);
if($cant_var==1){
    $tipo='Odometro';
}
switch ($tipo) {
    case 'Circular' :
        include("../../../FusionChartsFree/Code/PHP/Includes/FusionCharts.php");
           $strXML = "<graph caption='".substr($regt[0], 0,100)."' subcaption='".substr($regt[0], 101)." ' xAxisName='  ' showNames='1' yAxisName='  '
           decimalPrecision='2' formatNumberScale='0'>";
           for ($i=0;$i<$cant_var;$i++) {
               $strXML .= "<set name='".$sx[$i]."' value='".$sy[$i]."'/>";
           }
           $strXML .= "</graph>";
           echo renderChartHTML("../../../FusionChartsFree/Charts/FCF_Doughnut2D.swf", "", $strXML, "FactorySum", 800, 400);
    break;
    case 'Barra':
           include("../../../FusionChartsFree/Code/PHP/Includes/FusionCharts.php");
           $strXML = "<graph caption='$regt[0] ' xAxisName=' ' yAxisName='  '
           decimalPrecision='2' formatNumberScale='0' >";
           for ($i=0;$i<$cant_var;$i++) {
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
                    $strXML .= "<set name='".$sx[$i]."' value='".$sy[$i]."'color='".$color."' />";
           }
          $strXML .= "</graph>";
           echo renderChartHTML("../../../FusionChartsFree/Charts/FCF_Column3D.swf", "", $strXML, "myNext", 700, 400);
    break;
case 'Odometro' :
        include("../../../FusionChartsFree/Code/PHP/Includes/FusionCharts.php");
           $strXML = "<Chart bgColor='AEC0CA,FFFFFF' fillAngle='45' upperLimit='100' lowerLimit='10' majorTMNumber='10' majorTMHeight='8' showGaugeBorder='0' 
       gaugeOuterRadius='140' gaugeOriginX='205' gaugeOriginY='206' gaugeInnerRadius='2' formatNumberScale='1' numberPrefix='' displayValueDistance='30' 
       decimalPrecision='2' tickMarkDecimalPrecision='1' pivotRadius='17' showPivotBorder='1' pivotBorderColor='000000' pivotBorderThickness='5' 
       pivotFillMix='FFFFFF,000000'>
    <colorRange>
        <color minValue='10' maxValue='40' code='B41527'/>
        <color minValue='40' maxValue='70' code='E48739'/>
        <color minValue='70' maxValue='100' code='399E38'/>
    </colorRange>
    <dials>";
           for ($i=0;$i<$cant_var;$i++) {
               $strXML .= "<dial value='".$sy[$i]."' borderAlpha='0' bgColor='000000' baseWidth='28' topWidth='1' radius='130'/>";
           }
           $strXML .= "</dials>
    <annotations>
        <annotationGroup xPos='205' yPos='207.5'>
            <annotation type='circle' xPos='0' yPos='2.5' radius='150' startAngle='0' endAngle='180' fillPattern='linear' fillAsGradient='1' 
                        fillColor='dddddd,666666' fillAlpha='100,100' fillRatio='50,50' fillDegree='0' showBorder='1' borderColor='444444' 
                        borderThickness='2'/>
            <annotation type='circle' xPos='0' yPos='0' radius='145' startAngle='0' endAngle='180' fillPattern='linear' fillAsGradient='1' 
                        fillColor='666666,ffffff' 
                        fillAlpha='100,100' fillRatio='50,50' fillDegree='0'/>
        </annotationGroup>
    </annotations>
</Chart>";
        echo renderChartHTML("../../../FusionChartsFree/Charts/AngularGauge.swf", "", $strXML, "FactorySum", 800, 400);
    break;
    case 'Linea' :
        include("../../../FusionChartsFree/Code/PHP/Includes/FusionCharts.php");
           $strXML = "<graph caption='$regt[0] ' subcaption=' ' xAxisName=' '
       yAxisMinValue='15000' yAxisName='' decimalPrecision='2' formatNumberScale='0' numberPrefix=''
       showNames='1' showValues='0' showAlternateHGridColor='1' AlternateHGridColor='ff5904'
       divLineColor='ff5904' divLineAlpha='20' alternateHGridAlpha='5'>";
           for ($i=0;$i<$cant_var;$i++) {
               $strXML .= "<set name='".$sx[$i]."' value='".$sy[$i]."'/>";
           }
           $strXML .= "</graph>";
           echo renderChartHTML("../../../FusionChartsFree/Charts/FCF_Line.swf", "", $strXML, "FactorySum", 600, 350);
    break;
}
?>
