// JavaScript Document

var ObjetoAjax;
var accion=0;
var caso=0;
/************************************************************************************************/
/*  					Funcion Para Cerrar una ventana											*/
/************************************************************************************************/
function CerrarVentana(){
	window.close();
}

function ventana(){
	alert('entro');
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
/************************************************************************************************/
/* 			Funcion Para Mostrar los Detalles de la Solicitud de Laboratorio					*/
/************************************************************************************************/
function guardar1(obj){	
		ObjetoAjax=NuevoAjax();			
		// Hacer el Request y llamar o Dibujar el Resultado
		accion=0;
		param = 'Id='+obj;
		ObjetoAjax.onreadystatechange = CargarContenidoActualizacion;
		ObjetoAjax.open("POST", 'guardarmtto.php', true);
		ObjetoAjax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');

		// Declaración de parámetros
		ObjetoAjax.send(param); 
		
		//alert(param)
		// Concatenación y Envío de Parámetros
}

function guardar2(obj){	
		ObjetoAjax=NuevoAjax();			
		// Hacer el Request y llamar o Dibujar el Resultado
		accion=0;
		var costou = document.getElementById(obj).value;
		costou = convierteAlias (costou);
	
		
		
		param = 'Id='+obj+'&valor='+costou;
		ObjetoAjax.onreadystatechange = CargarContenidoActualizacion;
		ObjetoAjax.open("POST", 'guardarcosto.php', true);
		ObjetoAjax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');

		// Declaración de parámetros
		ObjetoAjax.send(param); 
		
		//alert(param)
		// Concatenación y Envío de Parámetros
}

/************************************************************************************************/
/* 			Funcion para Cargar el Contenido de los Resultados									*/
/************************************************************************************************/

function CargarContenidoActualizacion(){
  // Si se Tarda en Cargar los datos que lanze los siguientes mensajes dependiendo del caso que sea	 
if (ObjetoAjax.readyState==1) {                    
	if(accion==0)
	 	document.getElementById('actualizar').innerHTML = "<center><img src='loading.gif' alt='Cargando...' /><br>Cargando Resultados...! </center>";
			
  	}	 // Fin Estado Cargando

  else if (ObjetoAjax.readyState == 4){//4 The request se Completó y vamos a cargar
	

	  if (ObjetoAjax.status == 200){//200 Significa que vamos cargar porque el request se Realizó....!
		respuesta = ObjetoAjax.responseText;	
		document.getElementById('actualizar').innerHTML='';
		  /*************Dependiendo la Accion ejecutamos la Respuesta: En este caso cargar Solicitudes**************/

			if(accion==0){
					document.getElementById('actualizar').innerHTML = respuesta;
					location.href="./index.php";
			}
			}   // Fin  If Status 200
		  
	  
	    
  } // Fin ReadyState 4
	 
        
}// Fin de la Funcion ProcesaEsp


function convierteAlias (nuevoAlias) {

 especiales = ',';
 normales = '';
 
 nuevoAlias = nuevoAlias.toLowerCase();
 
 i=0;
 while (i<especiales.length) {
  //nuevoAlias = nuevoAlias.replace(especiales[i], normales[i]);
  nuevoAlias = nuevoAlias.split(especiales).join(normales);
  i++
 }

 return nuevoAlias;

}