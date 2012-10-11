var ObjetoAjax;
var accion=0;
var caso=0;
a = new Array();
/************************************************************************************************/
/*  					Funcion Para Cerrar una ventana											*/
/************************************************************************************************/
function CerrarVentana(){
	window.close();
}


/************************************************************************************************/
/*  					Funcion Para Crear un Objeto Ajax										*/
/************************************************************************************************/
function NuevoAjax(){
	var ObjetoAjax=false;
	//Para navegadores distintos a internet explorer
	try {
		ObjetoAjax = new ActiveXObject("Msxml2.XMLHTTP");
	}
	catch (e) {
		try {  /*Para explorer*/
			ObjetoAjax = new ActiveXObject("Microsoft.XMLHTTP");
		} catch (E) {
			ObjetoAjax = false;
	 	}
	}
	if (!ObjetoAjax && typeof XMLHttpRequest!='undefined') {
		ObjetoAjax = new XMLHttpRequest();
	}
	return ObjetoAjax; //Retornar Objeto Ajax
}

function marcar(val){
    var n = a.length;
//    alert(val);
//if(a.length>0){
//    a.splice(a.indexOf(val), 1);
//}
  a[n]= val;

if(a.length<=0){
    document.getElementById('graficar').disabled=true;
    alert(a);
}else{
document.getElementById('graficar').disabled=false;
//alert(a);
}
}

function irpanel(){
    var b=a;
document.getElementById('datos').value=b;
javascript:window.location=('conf_indicador.php?datos='+b);
}

function irpanel1(){
    var b=document.getElementById('datos').value.substring(1);
    var id = b.split(",");
    var param='';
    for (i=0;i<id.length;i=i+1) {
        param=param+"&";
        eval("campo"+id[i]+"=document.getElementById('campos'+id[i]).value.substring(1)");
        param=param+(eval('campo'+id[i]));
    }
    document.getElementById('campos').value=param;
}

function prueba(){
    alert('hola');
}
function CargarContenido(){
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


function hola(){
   		accion=0;
		caso=0;
		ObjetoAjax=NuevoAjax();
		ObjetoAjax.onreadystatechange = CargarContenido;
		ObjetoAjax.open("POST", 'filtrar.php', true);
		ObjetoAjax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
                var nombre= 	document.getElementById('nombre').value;
		var tema=	document.getElementById('tema').value;
		var cnivel= 	document.getElementById('cnivel').value;
                var ctecnica= 	document.getElementById('ctecnica').value;
		var cuso=	document.getElementById('cuso').value;
		var responsable=document.getElementById('responsable').value;

		var param = 'nombre='+nombre+'&tema='+tema+'&cnivel='+cnivel+'&ctecnica='+ctecnica+'&cuso='+cuso+'&responsable='+responsable;
		ObjetoAjax.send(param);
 }

function rangos(id){
   		accion=0;
		caso=0;
                idx=id
		ObjetoAjax=NuevoAjax();
		ObjetoAjax.onreadystatechange = CargarContenido1;
		ObjetoAjax.open("POST", 'grupos.php', true);
		ObjetoAjax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		var param = 'id= '+id;
		ObjetoAjax.send(param);
 }
 
function CargarContenido1(){
var txt='resultado'+idx;
	// Si se Tarda en Cargar los datos que lanze los siguientes mensajes dependiendo del caso que sea
	if (ObjetoAjax.readyState==1) {
		if(accion==0)
	 		document.getElementById(txt).innerHTML = "<center><img src='loading.gif' alt='Cargando...' /><br>Cargando Resultados...! </center>";
  	}	 // Fin Estado Cargando
	else if (ObjetoAjax.readyState == 4){//4 The request se Complet� y vamos a cargar
		if (ObjetoAjax.status == 200){//200 Significa que vamos cargar porque el request se Realiz�....!
			respuesta = ObjetoAjax.responseText;
			document.getElementById(txt).innerHTML='';
			/*************Dependiendo la Accion ejecutamos la Respuesta: En este caso cargar Solicitudes**************/
			if(accion==0){
				if(caso==0)
					document.getElementById(txt).innerHTML = respuesta;
	  		}
		}   // Fin  If Status 200
	} // Fin ReadyState 4
}// Fin de la Funcion ProcesaEsp

function rangos1(id){
   		accion=0;
		caso=0;
                idx=id;
		ObjetoAjax=NuevoAjax();
		ObjetoAjax.onreadystatechange = CargarContenido1x;
		ObjetoAjax.open("POST", 'grupos1.php', true);
		ObjetoAjax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		var param = 'id= '+id;
		ObjetoAjax.send(param);
 }
function CargarContenido1x(){
var txt='resultado1'+idx;
	// Si se Tarda en Cargar los datos que lanze los siguientes mensajes dependiendo del caso que sea
	if (ObjetoAjax.readyState==1) {
		if(accion==0)
	 		document.getElementById(txt).innerHTML = "<center><img src='loading.gif' alt='Cargando...' /><br>Cargando Resultados...! </center>";
  	}	 // Fin Estado Cargando
	else if (ObjetoAjax.readyState == 4){//4 The request se Complet� y vamos a cargar
		if (ObjetoAjax.status == 200){//200 Significa que vamos cargar porque el request se Realiz�....!
			respuesta = ObjetoAjax.responseText;
			document.getElementById(txt).innerHTML='';
			/*************Dependiendo la Accion ejecutamos la Respuesta: En este caso cargar Solicitudes**************/
			if(accion==0){
				if(caso==0)
					document.getElementById(txt).innerHTML = respuesta;
	  		}
		}   // Fin  If Status 200
	} // Fin ReadyState 4
}// Fin de la Funcion ProcesaEsp
