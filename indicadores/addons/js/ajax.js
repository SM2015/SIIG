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
function imprimir(){	
		//alert('Numero Expediente '+IdExpediente+'  Pagina '+pagina);
		 accion=0;
		 caso=0;
		 	
		// Crear Objeto Ajax
		ObjetoAjax=NuevoAjax();			
		// Hacer el Request y llamar o Dibujar el Resultado
		ObjetoAjax.onreadystatechange = CargarContenido;
		ObjetoAjax.open("POST", 'prueba.php', true);
		ObjetoAjax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');

		// Declaración de parámetros
		var id= document.getElementById('establecimientos').value;
		// Concatenación y Envío de Parámetros
		
		param = 'Id='+id;
		ObjetoAjax.send(param);  
}

function establecimientos(){	
		//alert('Numero Expediente '+IdExpediente+'  Pagina '+pagina);
		accion=0;
		 caso=0;
		// Crear Objeto Ajax
		ObjetoAjax=NuevoAjax();			
		// Hacer el Request y llamar o Dibujar el Resultado
		ObjetoAjax.onreadystatechange = CargarContenido;
		ObjetoAjax.open("POST", 'establecimientos.php', true);
		ObjetoAjax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');

		// Declaración de parámetros
		var id= document.getElementById('rector_nivel_id').value;
		
		// Concatenación y Envío de Parámetros
		param = 'Id='+id;
		ObjetoAjax.send(param);  
}

function dependencias(){	
		//alert('Numero Expediente '+IdExpediente+'  Pagina '+pagina);
		accion=0;
		caso=1;
		var ides= document.getElementById('u_establecimientos_id').value;
	 // Crear Objeto Ajax
		ObjetoAjax=NuevoAjax();	
		// Hacer el Request y llamar o Dibujar el Resultado
		ObjetoAjax.onreadystatechange = CargarContenido;
		ObjetoAjax.open("POST", 'dependencias.php', true);
		ObjetoAjax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		// Declaración de parámetros
		// Concatenación y Envío de Parámetros
		param = 'Id='+ides;
		ObjetoAjax.send(param);  
}
//******************************************************************************************
//Funciones Software
//******************************************************************************************
//software_detalle


function evaluarlibre(){	
		//alert('Numero Expediente '+IdExpediente+'  Pagina '+pagina);
		 accion=0;
		 caso=0;
		//var con= document.getElementById('$cnx').value;
	 	var escomercial= document.getElementById('libre').value;
	
		//alert('con='+conexion);
		
	
	if (escomercial==1 ){
			//document.getElementById('comercial').style.display="none";
			//document.getElementById('Layer1').style.display="block";
			
		document.getElementById('resultado').innerHTML='';
		//document.getElementById('comercial').innerHTML='';
	

		// Concatenación y Envío de Parámetros
		param = 'escomercial='+escomercial;
		ObjetoAjax.send(param);  
	}else if (escomercial!=1 ){
		
		window.location.href=window.location.href;
		
	}
}
//catalogoSoftware



function evaluar() {
	var escomercial= document.getElementById('evaluar').value;
	
	
	}
	
	
//cambia orden de muestra en el objeto calendario	
	

function Modificar(){
var FechaInicial=document.getElementById('FechaDB').value;
	//alert(FechaInicial);
	
	if(FechaInicial!=''){
		var FechaVector=FechaInicial.split('/');
		//2008/05/01
		var Ano = FechaVector[0];
		var Mes= FechaVector[1];
		var Dia=FechaVector[2];
		
		var FechaNueva = Dia +"/"+Mes+"/"+Ano;
		//alert(FechaNueva);
		document.getElementById('softdet_fecha_caducidad').value=FechaNueva;
	}
}//modificar

function Modificar2(){
var FechaInicialAd=document.getElementById('FechaDBAd').value;
	if(FechaInicialAd!=''){
		var FechaVector=FechaInicialAd.split('/');
		//2008/05/01
		var Ano = FechaVector[0];
		var Mes= FechaVector[1];
		var Dia=FechaVector[2];
		
		var FechaNueva = Dia +"/"+Mes+"/"+Ano;
		//alert(FechaNueva);
		document.getElementById('softdet_fecha_adquisicion').value=FechaNueva;
	 }
}//modificar2

function ocultarserver(){
	//alert('Numero Expediente '+IdExpediente+'  Pagina '+pagina);
		 accion=0;
		 caso=0;
		//var con= document.getElementById('$cnx').value;
	 	var escomercial= document.getElementById('monitor_cpu_pertenece_id').value;
	if (escomercial=='[Seleccione Uno ...]'){
		escomercial=0;
		}
		//alert('con='+conexion);
		
	
	if (escomercial!=0 ){
			//document.getElementById('comercial').style.display="none";
			//document.getElementById('Layer1').style.display="block";
			
		document.getElementById('ocultar').innerHTML='';
		//document.getElementById('comercial').innerHTML='';
	

		// Concatenación y Envío de Parámetros
		param = 'escomercial='+escomercial;
		ObjetoAjax.send(param);  
	}else if (escomercial==0 ){
		
		window.location.href=window.location.href;
		
	}
}

function ocultarcpu(){
	//alert('Numero Expediente '+IdExpediente+'  Pagina '+pagina);
		 accion=0;
		 caso=0;
		//var con= document.getElementById('$cnx').value;
	 	var escomercial= document.getElementById('monitor_server_pertenece_id').value;
	
		//alert('con='+conexion);
		
	
	if (escomercial!=0 ){
			//document.getElementById('comercial').style.display="none";
			//document.getElementById('Layer1').style.display="block";
			
		document.getElementById('ocultarcpu').innerHTML='';
		//document.getElementById('comercial').innerHTML='';
	

		// Concatenación y Envío de Parámetros
		param = 'escomercial='+escomercial;
		ObjetoAjax.send(param);  
	}else if (escomercial==0 ){
		
		window.location.href=window.location.href;
		
	
	}
}
/************************************************************************************************/
/* 			Funcion para Cargar el Contenido de los Resultados									*/
/************************************************************************************************/

function CargarContenido(){
		
  // Si se Tarda en Cargar los datos que lanze los siguientes mensajes dependiendo del caso que sea	 
if (ObjetoAjax.readyState==1) {                    
	if(accion==0)
	 	document.getElementById('resultado').innerHTML = "<center><img src='loading.gif' alt='Cargando...' /><br>Cargando Resultados...! </center>";
			
  	}	 // Fin Estado Cargando

  else if (ObjetoAjax.readyState == 4){//4 The request se Completó y vamos a cargar
	

	  if (ObjetoAjax.status == 200){//200 Significa que vamos cargar porque el request se Realizó....!
		respuesta = ObjetoAjax.responseText;	
		document.getElementById('resultado').innerHTML='';
		  /*************Dependiendo la Accion ejecutamos la Respuesta: En este caso cargar Solicitudes**************/

			if(accion==0){
				if(caso==0)
					document.getElementById('resultado').innerHTML = respuesta;
				else if(caso==1)
					document.getElementById('dependencias').innerHTML = respuesta;
	  			}
			}   // Fin  If Status 200
		  
	  
	    
  } // Fin ReadyState 4
	 
        
}// Fin de la Funcion ProcesaEsp
function filtrar(){
		 accion=0;
		// Crear Objeto Ajax
		ObjetoAjax=NuevoAjax();			
		// Hacer el Request y llamar o Dibujar el Resultado
		ObjetoAjax.onreadystatechange = CargarContenido;
		ObjetoAjax.open("POST", 'filtro.php', true);
		ObjetoAjax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');

		// Declaración de parámetros
		var campo= document.getElementById('campo').value;
		var valor= document.getElementById('valor').value;


		var rector= document.getElementById('rector').value;
		var establ= document.getElementById('establ').value;
		var depend= document.getElementById('depend').value;
		var nivel= document.getElementById('nivel').value;

		// Concatenación y Envío de Parámetros
		
		param = 'campo='+campo+'&valor='+valor+'&rector='+rector+'&establ='+establ+'&depend='+depend+'&nivel='+nivel;
		
		ObjetoAjax.send(param); 
		
}

//Función para validar el dato ingresado en la IP
function validarip(ID){
		var ip = document.getElementById(ID).value; //el ID del textbox
		var respuesta = 0;
	if(ip==''){
		document.getElementById(ID).value='N/A';
	}else{
		var partes=ip.split('.');
		var tamano=partes.length;
		 if(tamano!=4){//numero de bloques
			  //alert('Debe ingresar una IP válida');
			  //return (false);
			  respuesta++;
		 }//if partes
		if(tamano > 1){
			 for(i=0;i<4;i++){
				  var num=partes[i];
				  if(num>255 || num<0 || isNaN(num)){
					  //alert('Debe ingresar una IP válida');
					  //return (false);
					  respuesta++;
				  }//IF num
			 }//for
		}
		if(respuesta == 0){
		 alert('IP Ok');
		}else{
		 alert('IP NO valida');
		}
		//return(ip);
	}//if N/A
}//validarip


function modelo(){
		//alert('Numero Expediente '+IdExpediente+'  Pagina '+pagina);
		accion=0;
		 caso=0;
		// Crear Objeto Ajax
		
		ObjetoAjax=NuevoAjax();			
		// Hacer el Request y llamar o Dibujar el Resultado
		ObjetoAjax.onreadystatechange = CargarContenido1;
		ObjetoAjax.open("POST", 'filtrarmodelo.php', true);
		ObjetoAjax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');

		// Declaración de parámetros
		var idmarca= document.getElementById('imp_marca_equipo_id').value;
		var idtipo= document.getElementById('imp_tipo_impresor_id').value;
		
		// Concatenación y Envío de Parámetros
		param = 'idmarca='+idmarca+'&idtipo='+idtipo;
				 //alert(param);

		
		ObjetoAjax.send(param);  

}

function CargarContenido1(){
		
  // Si se Tarda en Cargar los datos que lanze los siguientes mensajes dependiendo del caso que sea	 
if (ObjetoAjax.readyState==1) {                    
	if(accion==0)
	 	document.getElementById('resultado').innerHTML = "<center><img src='loading.gif' alt='Cargando...' /><br>Cargando Resultados...! </center>";
			
  	}	 // Fin Estado Cargando

  else if (ObjetoAjax.readyState == 4){//4 The request se Completó y vamos a cargar
	

	  if (ObjetoAjax.status == 200){//200 Significa que vamos cargar porque el request se Realizó....!
		respuesta = ObjetoAjax.responseText;	
		document.getElementById('resultado').innerHTML='';
		  /*************Dependiendo la Accion ejecutamos la Respuesta: En este caso cargar Solicitudes**************/

			if(accion==0){
				if(caso==0)
					document.getElementById('resultado').innerHTML = respuesta;
				else if(caso==1)
					document.getElementById('dependencias').innerHTML = respuesta;
	  			}
			}   // Fin  If Status 200
	    
  } // Fin ReadyState 4
	 
        
}// Fin de la Funcion ProcesaEsp



function mostrartipo(){	
	document.getElementById('imp_tipo_impresor_id').disabled=false;
	document.getElementById('imp_modelo_id').disabled=false;

}
