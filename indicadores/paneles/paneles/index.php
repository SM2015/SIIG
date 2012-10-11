<?php 
session_start();
include_once("../../addons/general/general.php");
include_once("../../lib/menu.php");
include_once("../indicadores/indicadores.php");
$rol = (isset($_SESSION['rol']))? $_SESSION['rol'] : NULL;
$panel=0; 
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>Panel de Indicadores</title>
<table  border="0" cellpadding="2" cellspacing="0" class="dataTable" width="100%">
            <thead>
		<tr>
                    <th><?php //echo menu(1); ?></th>
		</tr>
            </thead>
	</table>
</head>
<style type="text/css">
body {
	margin:0;
	padding:0;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script type="text/javascript" src="../../addons/js/general.js"></script>
<script type="text/javascript" src="../../addons/js/gen_validatorv2.js"></script>
<script language="JavaScript" type="text/javascript" src="../../addons/tables/core.js"></script>
<script language="JavaScript" type="text/javascript" src="../../addons/tables/stripy_tables.js"></script>
<script language="JavaScript1.5" type="text/javascript" src="../../addons/chromemenu/chromejs/chrome.js"></script>
<script type="text/javascript" src="../../addons/yui1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../../addons/yui1/build/dragdrop/dragdrop-min.js"></script>
<script type="text/javascript" src="../../addons/yui1/build/slider/slider-min.js"></script>
<link rel="stylesheet" type="text/css" href="../../addons/chromemenu/chrometheme/chromestyle.css"/>
<link rel="stylesheet" type="text/css" href="../../addons/tables/stripy_tables.css"/>
<body class="yui-skin-sam">
<div id="listai">
<link rel="stylesheet" type="text/css" href="../../addons/yui1/build/fonts/fonts-min.css" />
<script type="text/javascript" src="../../addons/yui1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../../addons/yui1/build/animation/animation-min.js"></script>
<script type="text/javascript" src="../../addons/yui1/build/dragdrop/dragdrop-min.js"></script>
<link rel="stylesheet" type="text/css" href="../../../yui/examples/dd/assets/portal.css">
<script type="text/javascript" src="ajax1.js"></script>
<script type="text/javascript">
document.documentElement.className = "yui-pe";
</script>
<style type="text/css">
div.workarea { padding:10px; float:left }
ul.draglist { 
    position: relative;
    width: 375px;
    height:940px;
    border: 1px solid gray;
    list-style: none;
    margin:0;
    padding:0;
}
ul.draglist1 {
    position: relative;
    width: 130px;
    height:940px;
    background: #f7f7f7;
    border: 1px solid gray;
    list-style: none;
    margin:0;
    padding:0;
}
ul.draglist li {
    margin: 1px;
    cursor: move;
    zoom: 1;
}
ul.draglist_alt { 
    position: relative;
    width: 200px; 
    list-style: none;
    margin:0;
    padding:0;
    padding-bottom:20px;
}
ul.draglist_alt li {
    margin: 1px;
    cursor: move; 
}
li.list1 {
    background-color: #D1E6EC;
    border:1px solid #7EA6B2;
}
li.list2 {
    background-color: #D8D4E2;
    border:1px solid #6B4C86;
}
#user_actions { float: right; }
</style>
<?php
$datos = (isset($_REQUEST['datos'])) ? $_REQUEST['datos'] : '%';
$texto = (isset($_REQUEST['text'])) ? $_REQUEST['text'] : NULL;
$cnx = bdd_conectar();
$array = explode(",",$datos);
$cant_var=sizeof($array);
print $texto;
if ($datos=='%'){
  $panel=1; 
}  

//print $panel;
?>
<div class="workarea" >
    <input type="hidden" name="datos" id="datos" value="<?php echo $datos; ?>" />
    <input type="hidden" name="usr" id="usr" value="<?php echo $rol; ?>" />
  <input class="frm-btn-x" type="button" name="guardar" title="Guardar estos Indicadores" id="Cancel" value="Guardar" onclick="guardar();" />  
  <div id="resultado"></div>
  <h3>Indicadores</h3>
  <ul id="ula" class="draglist1">
<?php

$qv="SELECT s.id_usuario, s.id_indicador, s.temporal, s.seriex, s.seriey, s.tipop, s.tem, f.nombre, s.id_serie
FROM series as s, ficha_tecnica as f WHERE f.id_ficha_tecnica = s.id_indicador and s.temporal=2 and s.id_usuario= ".$rol;
$rsv= bdd_pg_query($cnx, $qv);
$num=@bdd_pg_num_rows($rsv);
$e=0;
if($num>0){
while ($regf = bdd_pg_fetch_row($rsv)){
   $qf = "UPDATE series SET tem=".($e+500)." WHERE id_serie=".$regf[8]." and  id_usuario=".$_SESSION['uid'];
   $rsf = @bdd_pg_query($cnx, $qf);
    ?>
        <li class="list2" id="li2_<?php echo ($e+500);?>" onmousedown="grafico(this,<?php echo $rol; ?>)">
            <div id="li2_<?php echo ($e+500);?>g"><?php echo $regf[7]; ?></div>
        </li> 
    <?php 
$seriex = str_replace("{","",$regf[3]);
$seriex = str_replace(",",",",$seriex);
$seriex = str_replace("}","",$seriex);
$seriey = str_replace("{","",$regf[4]);
$seriey = str_replace("}","",$seriey);
$sx= explode(",",$seriex);
$sy= explode(",",$seriey);
 echo   jpg($sx,$sy,($e+500),$regf[5],$cnx,2,$regf[1],' ');
 $e++;
}
}

if($panel==0){
for ($i=0; $i<$cant_var; $i++){
    $q="SELECT nombre, id_ficha_tecnica FROM ficha_tecnica where id_ficha_tecnica=".$array[$i];
    $rs = bdd_pg_query($cnx, $q);
    $reg = bdd_pg_fetch_row($rs);
    ?>
        <li class="list1" id="li1_<?php echo ($reg[1]+100);?>" onmousedown="grafico(this,<?php echo $rol; ?>)">
            <div id="li1_<?php echo ($reg[1]+100);?>g"><?php echo $reg[0]; ?></div>
        </li>
    <?php
}
}

	bdd_cerrar($cnx);
?>
 </ul>
</div>
<div class="workarea">
  <ul id="ul1" class="draglist">
  </ul>
</div>
<div class="workarea">
  <ul id="ul2" class="draglist">
  </ul>
</div>
<div class="workarea">
  <ul id="ul3" class="draglist">
  </ul>
</div>
<div class="workarea">
  <ul id="ul4" class="draglist">
  </ul>
</div>
<script type="text/javascript">
(function() {
var Dom = YAHOO.util.Dom;
var Event = YAHOO.util.Event;
var DDM = YAHOO.util.DragDropMgr;
//////////////////////////////////////////////////////////////////////////////
// example app
//////////////////////////////////////////////////////////////////////////////
YAHOO.example.DDApp = {
    init: function() {
        var rows=1000,cols=4,i,j;
        for (i=1;i<cols+1;i=i+1) {
            new YAHOO.util.DDTarget("ul"+i);
        }
        for (i=1;i<cols+1;i=i+1) {
            for (j=1;j<rows+1;j=j+1) {
                new YAHOO.example.DDList("li" + i + "_" + j);
            }
        }
        Event.on("showButton", "click", this.showOrder);
        Event.on("switchButton", "click", this.switchStyles);
    },
    showOrder: function() {
        var parseList = function(ul, title) {
            var items = ul.getElementsByTagName("li");
            var out = title + ": ";
            for (i=0;i<items.length;i=i+1) {
                out += items[i].id + " ";
            }
            return out;
        };
        var ul1=Dom.get("ul1"), ul2=Dom.get("ul2");
        alert(parseList(ul1, "List 1") + "\n" + parseList(ul2, "List 2"));
    },
    switchStyles: function() {
        Dom.get("ul1").className = "draglist_alt";
        Dom.get("ul2").className = "draglist_alt";
       Dom.get("ul3").className = "draglist_alt";
       Dom.get("ul4").className = "draglist_alt";
    }
};
//////////////////////////////////////////////////////////////////////////////
// custom drag and drop implementation
//////////////////////////////////////////////////////////////////////////////
YAHOO.example.DDList = function(id, sGroup, config) {
    YAHOO.example.DDList.superclass.constructor.call(this, id, sGroup, config);
    this.logger = this.logger || YAHOO;
    var el = this.getDragEl();
    Dom.setStyle(el, "opacity", 0.67); // The proxy is slightly transparent

    this.goingUp = false;
    this.lastY = 0;
};
YAHOO.extend(YAHOO.example.DDList, YAHOO.util.DDProxy, {
    startDrag: function(x, y) {
        this.logger.log(this.id + " startDrag");
        // make the proxy look like the source element
        var dragEl = this.getDragEl();
        var clickEl = this.getEl();
        Dom.setStyle(clickEl, "visibility", "hidden");
        dragEl.innerHTML = clickEl.innerHTML;
        Dom.setStyle(dragEl, "color", Dom.getStyle(clickEl, "color"));
        Dom.setStyle(dragEl, "backgroundColor", Dom.getStyle(clickEl, "backgroundColor"));
        Dom.setStyle(dragEl, "border", "2px solid gray");
    },
    endDrag: function(e) {
        var srcEl = this.getEl();
        var proxy = this.getDragEl();
        // Show the proxy element and animate it to the src element's location
        Dom.setStyle(proxy, "visibility", "");
        var a = new YAHOO.util.Motion( 
            proxy, { 
                points: { 
                    to: Dom.getXY(srcEl)
                }
            }, 
            0.2, 
            YAHOO.util.Easing.easeOut 
        );
        var proxyid = proxy.id;
        var thisid = this.id;
        // Hide the proxy and show the source element when finished with the animation
        a.onComplete.subscribe(function() {
                Dom.setStyle(proxyid, "visibility", "hidden");
                Dom.setStyle(thisid, "visibility", "");
            });
        a.animate();
    },
    onDragDrop: function(e, id) {
        // If there is one drop interaction, the li was dropped either on the list,
        // or it was dropped on the current location of the source element.
        if (DDM.interactionInfo.drop.length === 1) {
            // The position of the cursor at the time of the drop (YAHOO.util.Point)
            var pt = DDM.interactionInfo.point; 
            // The region occupied by the source element at the time of the drop
            var region = DDM.interactionInfo.sourceRegion; 
            // Check to see if we are over the source element's location.  We will
            // append to the bottom of the list once we are sure it was a drop in
            // the negative space (the area of the list without any list items)
            if (!region.intersect(pt)) {
                var destEl = Dom.get(id);
                var destDD = DDM.getDDById(id);
                destEl.appendChild(this.getEl());
                destDD.isEmpty = false;
                DDM.refreshCache();
            }
        }
    },
    onDrag: function(e) {
        // Keep track of the direction of the drag for use during onDragOver
        var y = Event.getPageY(e);
        if (y < this.lastY) {
            this.goingUp = true;
        } else if (y > this.lastY) {
            this.goingUp = false;
        }
        this.lastY = y;
    },
    onDragOver: function(e, id) {
        var srcEl = this.getEl();
        var destEl = Dom.get(id);
        // We are only concerned with list items, we ignore the dragover
        // notifications for the list.
        if (destEl.nodeName.toLowerCase() == "li") {
            var orig_p = srcEl.parentNode;
            var p = destEl.parentNode;
            if (this.goingUp) {
                p.insertBefore(srcEl, destEl); // insert above
            } else {
                p.insertBefore(srcEl, destEl.nextSibling); // insert below
            }
           DDM.refreshCache();
        }
    }
});
Event.onDOMReady(YAHOO.example.DDApp.init, YAHOO.example.DDApp, true);
})();
</script>
<?php
//}else{ ?>
    <script>
     //   alert('Seleccione los indicadores que quiere que se muestren en el panel');
     //   document.location.href='/indicadores/paneles/indicadores/index.php'
    </script>
<?php
//}
?>
</div>
</body>
</html>
