var ObjetoAjax;
var accion=0;
var caso=0;
function CerrarVentana(){
	window.close();
}
function NuevoAjax(){
	var ObjetoAjax=false;
	try {
		ObjetoAjax = new ActiveXObject("Msxml2.XMLHTTP");
	} 
	catch (e) {	
		try {  
			ObjetoAjax = new ActiveXObject("Microsoft.XMLHTTP");
		} catch (E) {
			ObjetoAjax = false;
	 	}
	}
	if (!ObjetoAjax && typeof XMLHttpRequest!='undefined') {
		ObjetoAjax = new XMLHttpRequest();
	}
	return ObjetoAjax; 
}

function grafico(obj,uid){
    tem=uid;
    valor=obj.id;
   		accion=0;
		caso=0;
		ObjetoAjax=NuevoAjax();			
		ObjetoAjax.onreadystatechange = CargarContenido;
		ObjetoAjax.open("POST", 'grafico.php', true);
		ObjetoAjax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
}

function CargarContenido(){
var valor1=valor+'g';
if (ObjetoAjax.readyState==1) {                    
	if(accion==0)   document.getElementById(valor1).innerHTML = "<left><div align='right'>"+valor1.substring(0,7)+"\n\
        <button id='"+valor1+"a' name='ventana' title='ventana'  onclick='graficog(this,"+tem+")'> <img src='grafico.jpg'>  </button>  \n\
        <button id='"+valor1+"b' name='eliminar' title='eliminar'  onclick='eliminar(this,"+tem+")'> <img src='eliminar.jpg'>  </button>  \n\
         <button id='"+valor1+"c' name='ficha' title='ficha'  onclick='ficha(this,"+tem+")'> <img src='ficha.gif'>  </button> \n\
        <button id='"+valor1+"d' name='datos' title='datos'  onclick='datos(this,"+tem+")'> <img src='datos.png'>  </button> \n\
         <INPUT id='"+valor1+"x' type=button name='minimizar' title='Minimizar' value='^' onclick='minimizar(this)'</INPUT>\n\
        <INPUT type=button name='cerrar' id='"+valor1+"c' value='X' onclick='cerrar(this)' </INPUT>\n\
        </div><div id='"+valor1+"x1' align='left'><img src='../indicadores/img/"+valor1+".png'/></div></left>";
  	}	 
	else if (ObjetoAjax.readyState == 4){
		if (ObjetoAjax.status == 200){
			respuesta = ObjetoAjax.responseText;	
			document.getElementById(valor1).innerHTML='';
					document.getElementById(valor1).innerHTML = respuesta;
		}   
	} 
}

function minimizar(obl){
    var txt=obl.id.substring(0,7);
    document.getElementById(txt).innerHTML="<left><div align='right'>"+txt+" \n\
    <INPUT id='"+txt+"x' type=button name='maximisar' title='Maximisar' value='v' onclick='grafico1(this)'</INPUT>\n\
    <INPUT type=button name='cerrar' id='"+txt+"c' value='X' onclick='cerrar(this)' </INPUT> \n\
    </div><div id='"+txt+"x1' align='left'></div></left>";
}
function grafico1(obj){
    var txt=obj.id.substring(0,7);
    grafico2(txt);
}

function cerrar(obj) {
var Dom = YAHOO.util.Dom;
        var parseList = function(ul) {
            var out = new Array();
            var items = ul.getElementsByTagName("li");
                out[0]=obj.id;    
           for (i=1;i<=items.length;i=i+1) {
                out[i]= items[i-1].id ;
            }
            return out;
        };
        var ula=Dom.get("ula");
        var ul1=Dom.get("ul1");
        var ul2=Dom.get("ul2");
        var ul3=Dom.get("ul3");
        var ul4=Dom.get("ul4");
        lista = parseList(ula);
        lista1 = parseList(ul1);
        lista2 = parseList(ul2);
        lista3 = parseList(ul3);
        lista4 = parseList(ul4);
        actualizar(lista, lista1, lista2, lista3, lista4);
}

function actualizar(lista, lista1, lista2, lista3, lista4){
    lista=lista;
    lista1=lista1;
    lista2=lista2;
    lista3=lista3;
    lista4=lista4;
                accion=0;
		caso=0;
		ObjetoAjax=NuevoAjax();
		ObjetoAjax.onreadystatechange = CargarContenido2;
		ObjetoAjax.open("POST", 'grafico.php', true);
		ObjetoAjax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
}


function grafico2(txt){	
                valor=txt;
                accion=0;
		caso=0;
		ObjetoAjax=NuevoAjax();			
		ObjetoAjax.onreadystatechange = CargarContenido1;
		ObjetoAjax.open("POST", 'grafico.php', true);
		ObjetoAjax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
}

function CargarContenido1(){
var valor1x=valor;
var valor1=valor+'g';
if (ObjetoAjax.readyState==1) {                    
if(accion==0)                   
    document.getElementById(valor1x).innerHTML =
"<left><div align='right'>"+valor1.substring(0,7)+"\n\
        <button id='"+valor1+"a' name='ventana' title='ventana'  onclick='graficog(this,"+tem+")'> <img src='grafico.jpg'>  </button>  \n\
        <button id='"+valor1+"b' name='eliminar' title='eliminar'  onclick='eliminar(this,"+tem+")'> <img src='eliminar.jpg'>  </button>  \n\
         <button id='"+valor1+"c' name='ficha' title='ficha'  onclick='ficha(this,"+tem+")'> <img src='ficha.gif'>  </button>\n\
         <INPUT id='"+valor1+"x' type=button name='minimizar' title='Minimizar' value='^' onclick='minimizar(this)'</INPUT>\n\
        <INPUT type=button name='cerrar' id='"+valor1+"c' value='X' onclick='cerrar(this)' </INPUT>\n\
        </div><div id='"+valor1+"x1' align='left'><img src='../indicadores/img/"+valor1+".png'/></div></left>";                                 
  	}	
	else if (ObjetoAjax.readyState == 4){
		if (ObjetoAjax.status == 200){
			respuesta = ObjetoAjax.responseText;	
			document.getElementById(valor1).innerHTML='';
					document.getElementById(valor1).innerHTML = respuesta;
		}   
	} 
}

function CargarContenido2(){
var valor1x='listai';
var listaa=lista;
var lista1a=lista1;
var lista2a=lista2;
var lista3a=lista3;
var lista4a=lista4;
if (ObjetoAjax.readyState==1) {
if(accion==0)           document.getElementById(valor1x).innerHTML = variable(listaa, lista1a, lista2a, lista3a, lista4a);dda();
  	}	 
	else if (ObjetoAjax.readyState == 4){
		if (ObjetoAjax.status == 200){
			respuesta = ObjetoAjax.responseText;
			document.getElementById(valor1).innerHTML='';
					document.getElementById(valor1).innerHTML = respuesta;
		}   
	} 
}

function variable(lista, lista1, lista2, lista3, lista4){
         var listaa = lista;
         var lista1a= lista1;
         var lista2a= lista2;
         var lista3a= lista3;
         var lista4a= lista4;
    txt=" \n\
    <link rel='stylesheet' type='text/css' href='../../addons/yui1/build/fonts/fonts-min.css' />  \n\
    <script type='text/javascript' src='../../addons/yui1/build/yahoo-dom-event/yahoo-dom-event.js'></script>  \n\
    <script type='text/javascript' src='../../addons/yui1/build/animation/animation-min.js'></script>  \n\
    <script type='text/javascript' src='../../addons/yui1/build/dragdrop/dragdrop-min.js'></script>  \n\
    <link rel='stylesheet' type='text/css' href='../../../yui/examples/dd/assets/portal.css'>  \n\
    <script type='text/javascript' src='ajax1.js'></script>  \n\
    <style type='text/css'>  \n\
    div.workarea { padding:10px; float:left }  \n\
    ul.draglist {  \n\
        position: relative;  \n\
        width: 375px;  \n\
        height:940px;  \n\
        border: 1px solid gray;  \n\
        list-style: none;  \n\
        margin:0;  \n\
        padding:0;  \n\
    }  \n\
    ul.draglist1 {  \n\
        position: relative; \n\
        width: 130px; \n\
        height:940px; \n\
        background: #f7f7f7; \n\
        border: 1px solid gray; \n\
        list-style: none; \n\
        margin:0; \n\
        padding:0; \n\
    } \n\
    ul.draglist li {  \n\
        margin: 1px; \n\
        cursor: move;  \n\
        zoom: 1; \n\
    } \n\
    ul.draglist_alt {  \n\
        position: relative;  \n\
        width: 200px;  \n\
        list-style: none; \n\
        margin:0; \n\
        padding:0; \n\
        padding-bottom:20px;  \n\
    } \n\
    ul.draglist_alt li { \n\
        margin: 1px; \n\
        cursor: move;  \n\
    } \n\
    li.list1 { \n\
        background-color: #D1E6EC; \n\
        border:1px solid #7EA6B2; \n\
    } \n\
    li.list2 {  \n\
        background-color: #D8D4E2; \n\
        border:1px solid #6B4C86; \n\
    } \n\
    #user_actions { float: right; } \n\
    </style>\n\
    <div class='workarea' > \n\\n\
<input class='frm-btn-x' type='button' name='guardar' title='Guardar estos Indicadores' id='Cancel' value='Guardar' onclick='guardar();' />  \n\
  <div id='resultado'></div>    \n\
    <h3>Indicadores</h3>  <ul id='ula' class='draglist1'>";
    for (i=0;i<listaa.length;i=i+1) {
        txt5=listaa[i].substr(0,7);
        txt= txt+"<li class='list1' id='"+listaa[i].substr(0,7)+"' onmousedown='grafico(this)'><div id='"+listaa[i].substr(0,7)+"g'>\n\
        <left><div align='right'>"+txt5+" \n\
        </div><div id='"+txt5+"x1' align='left'></div></left>\n\
        </div></li>";
    }
    txt= txt+"</ul> </div> \n\
    <div class='workarea'>   <ul id='ul1' class='draglist'>";
    if(lista1a.length>=1){
        for (i=1;i<lista1a.length;i=i+1) {
            if(lista1a[0].substr(0,7)!=lista1a[i].substr(0,7)){
                 txt5=lista1a[i].substr(0,7);
                txt= txt+"<li class='list1' id='"+lista1a[i].substr(0,7)+"' onmousedown='grafico(this)'><div id='"+lista1a[i].substr(0,7)+"g'>\n\
                <left><div align='right'>"+txt5+" \n\
                <INPUT id='"+txt5+"x' type=button name='minimizar' title='Minimizar' value='^' onclick='minimizar(this)'</INPUT> \n\
                <INPUT type=button name='cerrar' id='"+txt5+"c' value='X' onclick='cerrar(this)' </INPUT> \n\
                </div><div id='"+txt5+"x1' align='left'><img src='../indicadores/img/"+txt5+".png'/></div></left>\n\
                </div></li>";
            }
        }
    }   
    txt= txt+"  </ul> </div>  <div class='workarea'>  <ul id='ul2' class='draglist'>";
    if(lista2a.length>=1){
        for (i=1;i<lista2a.length;i=i+1) {
            if(lista2a[0].substr(0,7)!=lista2a[i].substr(0,7)){
                 txt5=lista2a[i].substr(0,7);
                txt= txt+"<li class='list1' id='"+lista2a[i].substr(0,7)+"' onmousedown='grafico(this)'><div id='"+lista2a[i].substr(0,7)+"g'>\n\
                <left><div align='right'>"+txt5+" \n\
                <INPUT id='"+txt5+"x' type=button name='minimizar' title='Minimizar' value='^' onclick='minimizar(this)'</INPUT> \n\
                <INPUT type=button name='cerrar' id='"+txt5+"c' value='X' onclick='cerrar(this)' </INPUT> \n\
                </div><div id='"+txt5+"x1' align='left'><img src='../indicadores/img/"+txt5+".png'/></div></left>\n\
                </div></li>";
            }
        }
    }   
    txt= txt+"  </ul> </div>  <div class='workarea'>  <ul id='ul3' class='draglist'>";
    if(lista3a.length>=1){
        for (i=1;i<lista3a.length;i=i+1) {
            if(lista3a[0].substr(0,7)!=lista3a[i].substr(0,7)){
                 txt5=lista3a[i].substr(0,7);
                txt= txt+"<li class='list1' id='"+lista3a[i].substr(0,7)+"' onmousedown='grafico(this)'><div id='"+lista3a[i].substr(0,7)+"g'>\n\
                <left><div align='right'>"+txt5+" \n\
                <INPUT id='"+txt5+"x' type=button name='minimizar' title='Minimizar' value='^' onclick='minimizar(this)'</INPUT> \n\
                <INPUT type=button name='cerrar' id='"+txt5+"c' value='X' onclick='cerrar(this)' </INPUT> \n\
                </div><div id='"+txt5+"x1' align='left'><img src='../indicadores/img/"+txt5+".png'/></div></left>\n\
                </div></li>";
            }
        }
    }   
    txt= txt+"  </ul> </div>  <div class='workarea'>  <ul id='ul4' class='draglist'>";
    if(lista4a.length>=1){
        for (i=1;i<lista4a.length;i=i+1) {
            if(lista4a[0].substr(0,7)!=lista4a[i].substr(0,7)){
                 txt5=lista4a[i].substr(0,7);
                txt= txt+"<li class='list1' id='"+lista4a[i].substr(0,7)+"' onmousedown='grafico(this)'><div id='"+lista4a[i].substr(0,7)+"g'>\n\
                <left><div align='right'>"+txt5+" \n\
                <INPUT id='"+txt5+"x' type=button name='minimizar' title='Minimizar' value='^' onclick='minimizar(this)'</INPUT> \n\
                <INPUT type=button name='cerrar' id='"+txt5+"c' value='X' onclick='cerrar(this)' </INPUT> \n\
                </div><div id='"+txt5+"x1' align='left'><img src='../indicadores/img/"+txt5+".png'/></div></left>\n\
                </div></li>";
            }
        }
    }  
    txt= txt+"</ul> </div> ";
    return txt;
}

function dda(){
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
}

function graficog(obj,uid){
    var txt='img='+obj.id.substring(0,7);
    newWindow = window.open("ventana.php?"+txt+"&uid="+uid, txt, "toolbar=no,location=nos,scrollbars=no,width=725,height=425");
}

function CargarContenido4(){
	// Si se Tarda en Cargar los datos que lanze los siguientes mensajes dependiendo del caso que sea
	if (ObjetoAjax.readyState==1) {
		if(accion==0)
	 		document.getElementById('resultado').innerHTML = "<center><img src='loading.gif' alt='Cargando...' /><br>Cargando Resultados...! </center>";
  	}	 // Fin Estado Cargando
	else if (ObjetoAjax.readyState == 4){//4 The request se Complet� y vamos a cargar
		if (ObjetoAjax.status == 200){//200 Significa que vamos cargar porque el request se Realiz�....!
			respuesta = ObjetoAjax.responseText;
			document.getElementById('resultado').innerHTML='';
			/*************Dependiendo la Accion ejecutamos la Respuesta: En este caso cargar Solicitudes**************/
			if(accion==0){
				if(caso==0)
					document.getElementById('resultado').innerHTML = respuesta;
	  		}
		}   // Fin  If Status 200
	} // Fin ReadyState 4
}// Fin de la Funcion ProcesaEsp

function guardar(){
    datos= document.getElementById('datos').value;
    datos= document.getElementById('usr').value;
    alert(datos);
}

function guardar(){
   		accion=0;
		caso=1;
		ObjetoAjax=NuevoAjax();			
		ObjetoAjax.onreadystatechange = CargarContenidon;
		ObjetoAjax.open("POST", 'guardar.php', true);
		ObjetoAjax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		var datos= document.getElementById('datos').value;
                var usr = document.getElementById('usr').value;
		var param = 'datos='+datos+'&usr='+usr;
		ObjetoAjax.send(param);
}

function CargarContenidon(){
	if (ObjetoAjax.readyState==1) {                    
		if(accion==0)
	 		document.getElementById('resultado').innerHTML = "<center><img src='loading.gif' alt='Cargando...' /><br>Cargando Resultados...! </center>";
  	}	 
	else if (ObjetoAjax.readyState == 4){
		if (ObjetoAjax.status == 200){
			respuesta = ObjetoAjax.responseText;	
			document.getElementById('resultado').innerHTML='';
					document.getElementById('resultado').innerHTML = respuesta;
		}   
	} 
}

function eliminar(obj, usr){
       		accion=0;
		caso=1;
		ObjetoAjax=NuevoAjax();			
		ObjetoAjax.onreadystatechange = CargarContenidon;
		ObjetoAjax.open("POST", 'eliminar.php', true);
		ObjetoAjax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		var dato= obj.id;
                var param = 'dato='+dato+'&usr='+usr;
		ObjetoAjax.send(param);
}

function ficha(obj,usr){
    var txt='dato='+obj.id.substring(0,7);
    newWindow = window.open("ficha.php?"+txt+"&usr="+usr, txt);
}

function datos(obj,uid){
    var txt='img='+obj.id.substring(0,7);
    newWindow = window.open("datos.php?"+txt+"&uid="+uid, txt, "toolbar=no,location=nos,scrollbars=yes,width=725,height=425");
}



