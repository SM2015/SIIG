<?php
include_once("../../addons/general/general.php");
?>
<link rel="stylesheet" type="text/css" href="../../addons/yui1/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../../addons/yui1/build/container/assets/skins/sam/container.css" />
<script type="text/javascript" src="../../addons/yui1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../../addons/yui1/build/connection/connection-min.js"></script>
<script type="text/javascript" src="../../addons/yui1/build/element/element-min.js"></script>
<script type="text/javascript" src="../../addons/yui1/build/button/button-min.js"></script>
<script type="text/javascript" src="../../addons/yui1/build/dragdrop/dragdrop-min.js"></script>
<script type="text/javascript" src="../../addons/yui1/build/container/container-min.js"></script>
<script type="text/javascript" src="ajax1.js"></script>
<link rel="stylesheet" type="text/css" href="../../addons/css/general.css">
<script type="text/javascript" src="../../addons/js/general.js"></script>
<script type="text/javascript" src="../../addons/js/gen_validatorv2.js"></script>
<link rel="stylesheet" type="text/css" href="../../addons/tables/stripy_tables.css">
<script language="JavaScript" type="text/javascript" src="../../addons/tables/core.js"></script>
<script language="JavaScript" type="text/javascript" src="../../addons/tables/stripy_tables.js"></script>
<link rel="stylesheet" type="text/css" href="../../addons/chromemenu/chrometheme/chromestyle.css">
<script language="JavaScript1.5" type="text/javascript" src="../../addons/chromemenu/chromejs/chrome.js"></script>
<link rel="stylesheet" type="text/css" href="../../addons/yui1/build/fonts/fonts-min.css" />
<script type="text/javascript"></script>

<div style="float: left; width: 200px;" >
  <?php
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
$seriex = str_replace("{","['",$reg[3]);
$seriex = str_replace(",","','",$seriex);
$seriex = str_replace("}","']",$seriex);
$seriey = str_replace("{","[",$reg[4]);
$seriey = str_replace("}","]",$seriey);
$sx= explode(",",$seriex);
$sy= explode(",",$seriey);
$tipo=$reg[5];
$cant_var=sizeof($sx);
$qt="SELECT nombre FROM ficha_tecnica where id_ficha_tecnica=".$reg[1];
$rst= bdd_pg_query($cnx, $qt);
$regt = bdd_pg_fetch_row($rst);
echo $regt[0];
echo "<table  class='dataTable' >";
$cant_var=sizeof($sx);
for ($i=0;$i<$cant_var;$i++){
    echo "<tr>";
        echo "<td>".$sx[$i]."</td>";
        echo "<td>".$sy[$i]."</td>";
    echo "</tr>";

}
echo "</table>";
?>
</div>
<div style="float: left; width: 220px;" >

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
$seriex = str_replace("{","['",$reg[3]);
$seriex = str_replace(",","','",$seriex);
$seriex = str_replace("}","']",$seriex);
$seriey = str_replace("{","[",$reg[4]);
$seriey = str_replace("}","]",$seriey);
$sx= explode(",",$seriex);
$sy= explode(",",$seriey);
$tipo=$reg[5];
$cant_var=sizeof($sx);
$qt="SELECT nombre FROM ficha_tecnica where id_ficha_tecnica=".$reg[1];
$rst= bdd_pg_query($cnx, $qt);
$regt = bdd_pg_fetch_row($rst);
$regt='  ';
if($cant_var==1){
    $tipo='Odometro';
}
switch ($tipo) {
    case 'Circular' :
 ?>
    <script src="../../../rgraph/libraries/RGraph.common.core.js" ></script>
    <script src="../../../rgraph/libraries/RGraph.common.context.js" ></script>
    <script src="../../../rgraph/libraries/RGraph.common.annotate.js" ></script>
    <script src="../../../rgraph/libraries/RGraph.common.tooltips.js" ></script>
    <script src="../../../rgraph/libraries/RGraph.common.zoom.js" ></script>
    <script src="../../../rgraph/libraries/RGraph.pie.js" ></script>
    <script src="../../../rgraph/libraries/RGraph.common.resizing.js" ></script>
    <script src="../../../rgraph/libraries/RGraph.common.effects.js" ></script>
    <script>
        window.onload = function (){
            function getGradient(obj, color){
                var gradient = obj.context.createRadialGradient(obj.canvas.width / 2, obj.canvas.height / 2, 0, obj.canvas.width / 2, obj.canvas.height / 2, 200);
                gradient.addColorStop(0, 'black');
                gradient.addColorStop(0.5, color);
                gradient.addColorStop(1, 'black');
                return RGraph.isIE8() ? color : gradient;
            }
            var donut2 = new RGraph.Pie('donut2', <?php echo $seriey;?>);
            var e=0;
            tem= new Array();
<?php          for ($i=0;$i<$cant_var;$i++) { ?>
                    eval(" var gradient"+ e + " = getGradient(donut2, dame_color_aleatorio())");
                    tem[e]= eval(" gradient"+e) ;
                    e++;
<?php           } ?>
            donut2.Set('chart.variant', 'donut');
            donut2.Set('chart.text.size', 5);
            donut2.Set('chart.labels', <?php echo $seriex;?>);
            donut2.Set('chart.title', "<?php echo $regt[0];?>");
            donut2.Set('chart.gutter.left', 50);
            donut2.Set('chart.gutter.right', 50);
            donut2.Set('chart.strokestyle', 'rgba(0,0,0,0)');
            donut2.Set('chart.colors', tem);
            donut2.Draw();
            RGraph.Effects.Pie.Grow(donut2);
        }
        function dame_color_aleatorio(){
           hexadecimal = new Array("0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F")
           color_aleatorio = "#";
           for (i=0;i<6;i++){
              posarray = aleatorio(0,hexadecimal.length)
              color_aleatorio += hexadecimal[posarray]
           }
           return color_aleatorio
        }
        function aleatorio(inferior,superior){
           numPosibilidades = superior - inferior
           aleat = Math.random() * numPosibilidades
           aleat = Math.floor(aleat)
           return parseInt(inferior) + aleat
        }
</script>
</head>
<body>
        <div>
            <canvas id="donut2" width="450" height="350">[No canvas support]</canvas>
        </div>
<?php
    break;
   case 'Barra':
?>
    <script src="../../../rgraph/libraries/RGraph.common.core.js" ></script>
    <script src="../../../rgraph/libraries/RGraph.bar.js" ></script>
    <script src="../../../rgraph/libraries/RGraph.common.resizing.js" ></script>
    <script src="../../../rgraph/libraries/RGraph.common.effects.js" ></script>
    <script>
        window.onload = function ()        {
            var grad = document.getElementById("cvs").getContext('2d').createLinearGradient(0, 0, 0, 250);
            grad.addColorStop(0, 'red');
            grad.addColorStop(1, 'white');
            var config = {
                          'chart.text.size':                   5,
                          'chart.labels':                   <?php echo $seriex;?>,
                          'chart.title.yaxis':               '%',
                          'chart.title.yaxis.pos':           0.2,
                          'chart.title.xaxis':               '',
                          'chart.gutter.left':               45,
                          'chart.gutter.bottom':               35,
                          'chart.gutter.right':                5,
                          'chart.background.grid.autofit':  true,
                          'chart.strokestyle': 'rgba(0,0,0,0)',
                          'chart.title':                    '<?php echo $regt[0];?>',
                          'chart.resizable':                true
                         }
            var bar = new RGraph.Bar('cvs', <?php echo $seriey;?>);
            RGraph.SetConfig(bar, config);
            bar.Draw();
            //RGraph.Effects.Animate(bar, {'chart.hmargin': 40, 'chart.gutter.left': 25});
            RGraph.Effects.Bar.Grow(bar);
        }
    </script>
    <div font-family: Verdana">
        <canvas id="cvs" width="600" height="250">[No canvas support]</canvas>
    </div>
  <?php
    break;
case 'Fuel' :
    ?>
    <script src="../../../rgraph/libraries/RGraph.common.core.js" ></script>
    <script src="../../../rgraph/libraries/RGraph.common.effects.js" ></script>
    <script src="../../../rgraph/libraries/RGraph.fuel.js" ></script>
    <script>
        window.onload = function (){
            var fuel1 = new RGraph.Fuel('fuel1',0,100,25);
            RGraph.isIE8() ? fuel1.Draw() : RGraph.Effects.Fuel.Grow(fuel1);
            var fuel2 = new RGraph.Fuel('fuel2', 50, 100, 67);
            fuel2.Set('chart.needle.color', 'blue');
            fuel2.Set('chart.colors', ['#ddf']);
            fuel2.Set('chart.labels.empty', 'Half full\r\n(50l)');
            fuel2.Set('chart.labels.full', 'Full\r\n(100l)');
            fuel2.Set('chart.icon', '/images/water.jpg');
            fuel2.Draw();
        }
    </script>
   <div style="text-align: center">
            <canvas id="fuel1" width="200" height="200">[Please wait...]</canvas>
         </div>

    <?php
break;
case 'Odometro' :
?>
    <script src="../../../rgraph/libraries/RGraph.common.core.js" ></script>
    <script src="../../../rgraph/libraries/RGraph.common.context.js" ></script>
    <script src="../../../rgraph/libraries/RGraph.common.annotate.js" ></script>
    <script src="../../../rgraph/libraries/RGraph.common.tooltips.js" ></script>
    <script src="../../../rgraph/libraries/RGraph.common.zoom.js" ></script>
    <script src="../../../rgraph/libraries/RGraph.common.resizing.js" ></script>
    <script src="../../../rgraph/libraries/RGraph.meter.js" ></script>
        <script src="../../../rgraph/libraries/RGraph.common.resizing.js" ></script>
        <script src="../../../rgraph/libraries/RGraph.common.effects.js" ></script>

     <script>
        window.onload = function (){
            var meter2 = new RGraph.Meter('meter2', 0, 100, <?php echo $sy[0];?>);
            meter2.Set('chart.units.post', '%');
            meter2.Set('chart.red.start', 0);
            meter2.Set('chart.title', '<?php echo $regt[0];?>');
            meter2.Set('chart.red.end', 30);
            meter2.Set('chart.yellow.start', 30);
            meter2.Set('chart.yellow.end', 60);
            meter2.Set('chart.green.start', 60);
            meter2.Set('chart.green.end', 100);
            meter2.Set('chart.resizable', true);
            meter2.Draw();
        //    RGraph.Effects.jQuery.Expand(meter2);
        }
    </script>
      <div >
        <canvas id="meter2" width="400" height="250"><div class="canvasfallback">[No canvas support]</div></canvas>
    </div>
<?php
break;
    case 'Linea' :
?>
    <script src="../../../rgraph/libraries/RGraph.common.core.js"></script>
    <script src="../../../rgraph/libraries/RGraph.common.tooltips.js"></script>
    <script src="../../../rgraph/libraries/RGraph.common.resizing.js" ></script>
    <script src="../../../rgraph/libraries/RGraph.line.js"></script>
    <script src="../../../rgraph/libraries/RGraph.common.effects.js" ></script>

    <div style="position: relative; margin-right: 10px;">
        <canvas id="axes" width="51" height="170" style="position: absolute; top: 0pt; left: 0pt; z-index: 100;"></canvas>
        <div style="width: 600px; overflow: auto;">
            <canvas style="cursor: default;" id="cvs" width="1000" height="200"></canvas>
        </div>
    </div>
    <script>
         window.onload = function ()  {
            line = new RGraph.Line('cvs', <?php echo $seriey;?>);
            line.Set('chart.noaxes', true); // We draw the Y axis ourselves further down the page
            line.Set('chart.gutter.top', 25);
            line.Set('chart.title', '<?php echo $regt[0];?>');
            line.Set('chart.gutter.bottom', 35);
            line.Set('chart.gutter.left', 50);
            line.Set('chart.hmargin', 5);
            line.Set('chart.linewidth', 3);
            line.Set('chart.shadow', true);
            line.Set('chart.shadow.offsetx', 0);
            line.Set('chart.shadow.offsety', 0);
            line.Set('chart.shadow.blur', 15);
            line.Set('chart.shadow.color', 'red');
            line.Set('chart.text.angle', 15);
            line.Set('chart.tooltips', <?php echo $seriex;?>);
            line.Set('chart.labels', <?php echo $seriex;?>);
            line.Draw();
            RGraph.Effects.Line.Unfold(line);
            ca = document.getElementById("axes")
            co = ca.getContext('2d');
            ca.width = line.Get('chart.gutter.left') + 1;
            RGraph.Clear(ca, 'white');
            co.beginPath();
                co.moveTo(line.Get('chart.gutter.left'), line.Get('chart.gutter.top'));
                co.lineTo(line.Get('chart.gutter.left'), line.canvas.height - line.Get('chart.gutter.bottom'));
                var numTicks = 10;
                for (var i=0; i<=numTicks; ++i) {
                    co.moveTo(line.Get('chart.gutter.left'), line.Get('chart.gutter.top') + (((line.canvas.height - line.Get('chart.gutter.top') - line.Get('chart.gutter.bottom')) / numTicks) * i));
                    co.lineTo(line.Get('chart.gutter.left') - 3, line.Get('chart.gutter.top') + (((line.canvas.height - line.Get('chart.gutter.top') - line.Get('chart.gutter.bottom')) / numTicks) * i));
                }
            co.stroke();
            co.beginPath();
                var color = 'black';
                var size = 10;
               for (var i=0; i<5; ++i) {
                    co.fillStyle = color;
                    co.textAlign = 'right';
                    co.textBaseline = 'middle';
                    var h = line.canvas.height - line.Get('chart.gutter.top') - line.Get('chart.gutter.bottom');

                    RGraph.Text(co, 'Verdana', size, line.Get('chart.gutter.left') - 4, line.Get('chart.gutter.top') + (h * (i/5)), line.max - (line.max * (i/5)));
                }
                RGraph.Text(co,
                            'Verdana',
                            size,
                            line.Get('chart.gutter.left') - 4,
                            165,
                            '0');
            co.fill();
        }
    </script>
           <?php
     break;
}
?>



</div>