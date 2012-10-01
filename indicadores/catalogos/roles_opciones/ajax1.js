var ObjetoAjax;
var accion=0;
var caso=0;
/************************************************************************************************/
/*  					Funcion Para Cerrar una ventana											*/
/************************************************************************************************/
function CerrarVentana(){
	window.close();
}

function color1(celda){
   celda.style.backgroundColor="#EFFBFB";
}
function color2(celda){
   celda.style.backgroundColor="#FFFFFF"
} 
    valor=0;
    function cambiar(este){
        valor=1;
        aa=(este==0)?"variable":"variable1";
        bb=(este==0)?"variable1":"variable";
        a=document.forms[0][aa];
        b=document.forms[0][bb];
        if(a.value==''){
            return false;
        }
        seVa=a.options[a.selectedIndex];
        a[a.selectedIndex]=null;
        b.options[b.options.length]=seVa;
    }
    function seleccionar() {
        elem=document.getElementById('variable').options;
        for(i=0;i<elem.length;i++){
            elem[i].selected=true;
        }
        if(valor==1){
        document.add.submit();
        }
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

function opciones(obj){	
if(valor==0){
		accion=0;
		caso=0;
                id=obj.id;
		// Crear Objeto Ajax
		ObjetoAjax=NuevoAjax();			
		// Hacer el Request y llamar o Dibujar el Resultado
		ObjetoAjax.onreadystatechange = CargarContenido;
		ObjetoAjax.open("POST", 'opciones.php', true);
		ObjetoAjax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		// Declaraci�n de par�metros
		var rol= document.getElementById('rol').value;
	// Concatenaci�n y Env�o de Par�metros
		var param = 'rol='+rol+'&mopcion='+id;
		ObjetoAjax.send(param);
}else{
    alert('debe Guardar los datos o Cancelar');
    
}
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
					document.getElementById('resultado').innerHTML = respuesta;
			
		}   // Fin  If Status 200
	} // Fin ReadyState 4
}// Fin de la Funcion ProcesaEsp



