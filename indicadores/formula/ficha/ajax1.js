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
		try {  /*Para explorer*/
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

function compararps(){	
		accion=0;
		caso=0;
		ObjetoAjax=NuevoAjax();			
		ObjetoAjax.onreadystatechange = CargarContenido;
		ObjetoAjax.open("POST", 'formula.php', true);
		ObjetoAjax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		var formula= document.getElementById('formula').value;
                var param = 'formula='+formula;
		ObjetoAjax.send(param);
}

function botones(){
		accion=0;
		caso=1;
		ObjetoAjax=NuevoAjax();			
		ObjetoAjax.onreadystatechange = CargarContenido;
		ObjetoAjax.open("POST", 'botones.php', true);
		ObjetoAjax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
                var variable = new Array();
                for(l=0;l<document.getElementById('variable').length;l++){
                           variable[l] = document.getElementById('variable').options[l].value;
                }
 		var param = 'variable='+variable;
 		ObjetoAjax.send(param);    
}

function evalf(formula){
		accion=0;
		caso=2;
		ObjetoAjax=NuevoAjax();			
		ObjetoAjax.onreadystatechange = CargarContenido;
		ObjetoAjax.open("POST", 'evaluarf.php', true);
		ObjetoAjax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		var param = 'formula='+formula;
		ObjetoAjax.send(param);
}

function CargarContenido(){
if (caso==2){
    var txt='resultado2';
}
if (caso==1){
    var txt='resultado1';
}
if (caso==0){
    var txt='resultado';
}
    if (ObjetoAjax.readyState==1) {                    
		if(accion==0)
	 		document.getElementById(txt).innerHTML = "<center><img src='loading.gif' alt='Cargando...' /><br>Cargando Resultados...! </center>";
  	}	 // Fin Estado Cargando
	else if (ObjetoAjax.readyState == 4){
		if (ObjetoAjax.status == 200){
			respuesta = ObjetoAjax.responseText;	
			document.getElementById(txt).innerHTML='';
					document.getElementById(txt).innerHTML = respuesta;
			
		}
	}
}

function posicionCursor()
{
       var tb = document.getElementById("formula")
        var cursor = -1;
        // IE
        if (document.selection && (document.selection != 'undefined'))
        {
            var _range = document.selection.createRange();
            var contador = 0;
            while (_range.move('character', -1))
                contador++;
            cursor = contador;
        }
       // FF
        else if (tb.selectionStart >= 0)
            cursor = tb.selectionStart;
        document.getElementById("posicion").value=cursor;
}

function limpiar1(){
    document.getElementById('formula').value="";
 //   document.getElementById('formula').focus();
    document.getElementById('sumar').focus();
         compararps();
}

function diez(){
     var pos=document.getElementById("posicion").value;
     var tot=document.getElementById('formula').value.length;
      if( document.getElementById('formula').value.length <= pos ){
        document.getElementById('formula').value=document.getElementById('formula').value + '10';
        document.getElementById('formula').focus();
     }else{
        var cadena1 = document.getElementById('formula').value.substring(0,pos);
        var cadena2 = document.getElementById('formula').value.substring(pos,tot);
        var final1 =cadena1.concat( ' 10 ', cadena2 );
        document.getElementById('formula').value= final1;
     }
     compararps();
}

function cien(){
     var pos=document.getElementById("posicion").value;
     var tot=document.getElementById('formula').value.length;
      if( document.getElementById('formula').value.length <= pos ){
        document.getElementById('formula').value=document.getElementById('formula').value + '100';
        document.getElementById('formula').focus();
     }else{
        var cadena1 = document.getElementById('formula').value.substring(0,pos);
        var cadena2 = document.getElementById('formula').value.substring(pos,tot);
        var final1 =cadena1.concat( ' 100 ', cadena2 );
        document.getElementById('formula').value= final1;
     }
     compararps();
}

function mil(){
     var pos=document.getElementById("posicion").value;
     var tot=document.getElementById('formula').value.length;
      if( document.getElementById('formula').value.length <= pos ){
        document.getElementById('formula').value=document.getElementById('formula').value + '1000';
        document.getElementById('formula').focus();
     }else{
        var cadena1 = document.getElementById('formula').value.substring(0,pos);
        var cadena2 = document.getElementById('formula').value.substring(pos,tot);
        var final1 =cadena1.concat( ' 1000 ', cadena2 );
        document.getElementById('formula').value= final1;
     }
     compararps();
}

function sumar(){
     var pos=document.getElementById("posicion").value;
     var tot=document.getElementById('formula').value.length;
      if( document.getElementById('formula').value.length <= pos ){
        document.getElementById('formula').value=document.getElementById('formula').value + '+';
        document.getElementById('formula').focus();
     }else{
        var cadena1 = document.getElementById('formula').value.substring(0,pos);
        var cadena2 = document.getElementById('formula').value.substring(pos,tot);
        var final1 =cadena1.concat( ' + ', cadena2 );
        document.getElementById('formula').value= final1;
     }
     compararps();
}
function restar(){
      var pos=document.getElementById("posicion").value;
     var tot=document.getElementById('formula').value.length;
      if( document.getElementById('formula').value.length <= pos ){
        document.getElementById('formula').value=document.getElementById('formula').value + '-';
        document.getElementById('formula').focus();
     }else{
        var cadena1 = document.getElementById('formula').value.substring(0,pos);
        var cadena2 = document.getElementById('formula').value.substring(pos,tot);
        var final1 =cadena1.concat( '-', cadena2 );
        document.getElementById('formula').value= final1;
     }
     compararps();
}
function multiplicar(){
      var pos=document.getElementById("posicion").value;
     var tot=document.getElementById('formula').value.length;
      if( document.getElementById('formula').value.length <= pos ){
        document.getElementById('formula').value=document.getElementById('formula').value + '*';
        document.getElementById('formula').focus();
     }else{
        var cadena1 = document.getElementById('formula').value.substring(0,pos);
        var cadena2 = document.getElementById('formula').value.substring(pos,tot);
        var final1 =cadena1.concat( '*', cadena2 );
        document.getElementById('formula').value= final1;
     }
     compararps();
}
function dividir(){
     var pos=document.getElementById("posicion").value;
     var tot=document.getElementById('formula').value.length;
      if( document.getElementById('formula').value.length <= pos ){
        document.getElementById('formula').value=document.getElementById('formula').value + '/';
        document.getElementById('formula').focus();
     }else{
        var cadena1 = document.getElementById('formula').value.substring(0,pos);
        var cadena2 = document.getElementById('formula').value.substring(pos,tot);
        var final1 =cadena1.concat( '/', cadena2 );
        document.getElementById('formula').value= final1;
     }    
     compararps();
}
function abrirv(){
      var pos=document.getElementById("posicion").value;
     var tot=document.getElementById('formula').value.length;
      if( document.getElementById('formula').value.length <= pos ){
        document.getElementById('formula').value=document.getElementById('formula').value + '(';
        document.getElementById('formula').focus();
     }else{
        var cadena1 = document.getElementById('formula').value.substring(0,pos);
        var cadena2 = document.getElementById('formula').value.substring(pos,tot);
        var final1 =cadena1.concat( '(', cadena2 );
        document.getElementById('formula').value= final1;
     }    
}
function cerrarv(){
     var pos=document.getElementById("posicion").value;
     var tot=document.getElementById('formula').value.length;
      if( document.getElementById('formula').value.length <= pos ){
        document.getElementById('formula').value=document.getElementById('formula').value + ')';
        document.getElementById('formula').focus();
     }else{
        var cadena1 = document.getElementById('formula').value.substring(0,pos);
        var cadena2 = document.getElementById('formula').value.substring(pos,tot);
        var final1 =cadena1.concat( ')', cadena2 );
        document.getElementById('formula').value= final1;
     }    
     compararps();
}
function abriri(){
     var pos=document.getElementById("posicion").value;
     var tot=document.getElementById('formula').value.length;
      if( document.getElementById('formula').value.length <= pos ){
        document.getElementById('formula').value=document.getElementById('formula').value + '{';
        document.getElementById('formula').focus();
     }else{
        var cadena1 = document.getElementById('formula').value.substring(0,pos);
        var cadena2 = document.getElementById('formula').value.substring(pos,tot);
        var final1 =cadena1.concat( '{', cadena2 );
        document.getElementById('formula').value= final1;
     }    
}
function cerrari(){
      var pos=document.getElementById("posicion").value;
     var tot=document.getElementById('formula').value.length;
      if( document.getElementById('formula').value.length <= pos ){
        document.getElementById('formula').value=document.getElementById('formula').value + '}';
        document.getElementById('formula').focus();
     }else{
        var cadena1 = document.getElementById('formula').value.substring(0,pos);
        var cadena2 = document.getElementById('formula').value.substring(pos,tot);
        var final1 =cadena1.concat( '}', cadena2 );
        document.getElementById('formula').value= final1;
     }    
     compararps();
}
function exponencial(){
      var pos=document.getElementById("posicion").value;
     var tot=document.getElementById('formula').value.length;
      if( document.getElementById('formula').value.length <= pos ){
        document.getElementById('formula').value=document.getElementById('formula').value + '^';
        document.getElementById('formula').focus();
     }else{
        var cadena1 = document.getElementById('formula').value.substring(0,pos);
        var cadena2 = document.getElementById('formula').value.substring(pos,tot);
        var final1 =cadena1.concat( '^', cadena2 );
        document.getElementById('formula').value= final1;
     }
     compararps();
}
function raiz(){
      var pos=document.getElementById("posicion").value;
     var tot=document.getElementById('formula').value.length;
      if( document.getElementById('formula').value.length <= pos ){
        document.getElementById('formula').value=document.getElementById('formula').value + 'sqrt ';
        document.getElementById('formula').focus();
     }else{
        var cadena1 = document.getElementById('formula').value.substring(0,pos);
        var cadena2 = document.getElementById('formula').value.substring(pos,tot);
        var final1 =cadena1.concat( 'sqrt ', cadena2 );
        document.getElementById('formula').value= final1;
     }    
     compararps();
}
function nvar(obj){
    var nvariable = obj.value;
     var pos=document.getElementById("posicion").value;
     var tot=document.getElementById('formula').value.length;
      if( document.getElementById('formula').value.length <= pos ){
        document.getElementById('formula').value=document.getElementById('formula').value + '{'+nvariable+'}';
        document.getElementById('formula').focus();
     }else{
        var cadena1 = document.getElementById('formula').value.substring(0,pos);
        var cadena2 = document.getElementById('formula').value.substring(pos,tot);
        var final1 =cadena1.concat( '{',nvariable,'}', cadena2 );
        document.getElementById('formula').value= final1;
     }    
     compararps();
}
function cambiar(este){
aa=(este==0)?"variable":"variable1";
bb=(este==0)?"variable1":"variable";
a=document.forms[0][aa];
b=document.forms[0][bb];
if(a.value==''){return false;}
seVa=a.options[a.selectedIndex];
a[a.selectedIndex]=null;
b.options[b.options.length]=seVa;
}
function cambiar1(este){
aa=(este==0)?"periodos":"periodo1";
bb=(este==0)?"periodo1":"periodos";
a=document.forms[0][aa];
b=document.forms[0][bb];
if(a.value==''){return false;}
seVa=a.options[a.selectedIndex];
a[a.selectedIndex]=null;
b.options[b.options.length]=seVa;
}
function cambiar2(este){
aa=(este==0)?"presentacion":"presentacion1";
bb=(este==0)?"presentacion1":"presentacion";
a=document.forms[0][aa];
b=document.forms[0][bb];
if(a.value==''){return false;}
seVa=a.options[a.selectedIndex];
a[a.selectedIndex]=null;
b.options[b.options.length]=seVa;
}
function seleccionar(obj) {
    elem=obj.options;
    for(i=0;i<elem.length;i++){
        elem[i].selected=true;
    }
}

function calcular(){
    
    var botones=document.getElementById('boton').value;
    var formula=document.getElementById('formula').value;
    formula = formula.replace(/{/,"(")
    formula = formula.replace(/}/,")")
    formula = formula.replace(/{/,"(")
    formula = formula.replace(/}/,")")
    formula = formula.replace(/{/,"(")
    formula = formula.replace(/}/,")")
    formula = formula.replace(/{/,"(")
    formula = formula.replace(/}/,")")
    formula = formula.replace(/{/,"(")
    formula = formula.replace(/}/,")")
    formula = formula.replace(/{/,"(")
    formula = formula.replace(/}/,")")
    var strCompleta=botones.substring(1);
    var botones1=strCompleta.split(",");

for (i=0;i<botones1.length;i++){
        formula = formula.replace(botones1[i],"3");
    }
  evalf(formula);
}

//para imprimir


function xmlhttp(){
		var xmlhttp;
		try{xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");}
		catch(e){
			try{xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");}
			catch(e){
				try{xmlhttp = new XMLHttpRequest();}
				catch(e){
					xmlhttp = false;
				}
			}
		}
		if (!xmlhttp)
				return null;
			else
				return xmlhttp;
}//xmlhttp

function ImprimirPDF(id){
	var A = document.getElementById('salidaPDF');
		//Datos a ingresar
		var ajax = xmlhttp();
		ajax.onreadystatechange=function(){
				if(ajax.readyState==1){
				}
				if(ajax.readyState==4){
					var Respuesta=ajax.responseText;
					//window.location=Respuesta;
					A.innerHTML=Respuesta;
				}
			}
		ajax.open("GET","reporteficha.php?id="+id,true);
		ajax.send(null);
		return false;
}

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