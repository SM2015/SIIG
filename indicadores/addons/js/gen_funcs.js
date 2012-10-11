// JavaScript Document
function seleccionarID(usr, fld) {
	var f = document.getElementById(fld);
	for (i=0; i<= f.childNodes.length; i++) {
		//alert(f.childNodes[i].value);
		if (f.childNodes[i].value == usr){
			//alert(f.childNodes[i].value);
			f.selectedIndex = f.childNodes[i].index;
			return true;
		}
	}
}

function ventana(){
var uno = "esto es una preunba de function";

alert (uno);
}
/* Definiciones basicas de las Variables que Ocuparemos en las Funciones de Javascript
   Para Mostrar y ocultar las capas*/
   

/* Con estas Funciones  mostramos y ocultamos los Bloques*/	
function mostrar(bloque) {
OCULTO="none";
VISIBLE="block";
/*Para el Primer Link (Historial 1 en este caso), Cuando le de click al enlace va a mostrar
     la infomacion correspondiente al div que tiene id="bloque" y Ademas va a ocultar la informacion
	 de cualquier otro bloque que se vea en pantalla*/

	if(bloque=='bloque'){ /*Si el click de dio al enlace 1 (Historial 1 en este caso)*/
	  document.getElementById(bloque).style.display=VISIBLE; /* QUe muestre lo que esta dentro de div id='bloque'*/
	  document.getElementById('bloque2').style.display=OCULTO; 
	  document.getElementById('bloque3').style.display=OCULTO; 
	  document.getElementById('bloque4').style.display=OCULTO; 
	  document.getElementById('bloque5').style.display=OCULTO;
	  document.getElementById('bloque6').style.display=OCULTO; 
	  document.getElementById('bloque7').style.display=OCULTO; 
	  document.getElementById('bloque8').style.display=OCULTO; 
	  document.getElementById('bloque9').style.display=OCULTO;
	  document.getElementById('bloqueA').style.display=OCULTO;	   
	  document.getElementById('bloqueB').style.display=OCULTO;	
	  }

	if(bloque=='bloque2'){ /*Si al que le dio clik fue al link 2 _(Historial 2 en este caso) que muestre el div id='bloque2'*/
	  document.getElementById(bloque).style.display=VISIBLE; /*Que mueste el div id='bloque2'*/
	  document.getElementById('bloque').style.display=OCULTO;
	  document.getElementById('bloque3').style.display=OCULTO;
	  document.getElementById('bloque4').style.display=OCULTO; 
	  document.getElementById('bloque5').style.display=OCULTO; 
	  document.getElementById('bloque6').style.display=OCULTO; 
	  document.getElementById('bloque7').style.display=OCULTO; 
	  document.getElementById('bloque8').style.display=OCULTO; 
	  document.getElementById('bloque9').style.display=OCULTO;
	  document.getElementById('bloqueA').style.display=OCULTO;	
	  document.getElementById('bloqueB').style.display=OCULTO;	
	  }
	  
	  if(bloque=='bloque3'){ /*Si al que le dio clik fue al link 2 _(Historial 2 en este caso) que muestre el div id='bloque2'*/
	  document.getElementById(bloque).style.display=VISIBLE; /*Que mueste el div id='bloque2'*/
	  document.getElementById('bloque').style.display=OCULTO;
	  document.getElementById('bloque2').style.display=OCULTO; 
	  document.getElementById('bloque4').style.display=OCULTO;
	  document.getElementById('bloque5').style.display=OCULTO;
	  document.getElementById('bloque6').style.display=OCULTO; 
	  document.getElementById('bloque7').style.display=OCULTO; 
	  document.getElementById('bloque8').style.display=OCULTO; 
	  document.getElementById('bloque9').style.display=OCULTO;
	  document.getElementById('bloqueA').style.display=OCULTO;		  
	  document.getElementById('bloqueB').style.display=OCULTO;	
	  }
	  
	   if(bloque=='bloque4'){ /*Si al que le dio clik fue al link 2 _(Historial 2 en este caso) que muestre el div id='bloque2'*/
	  document.getElementById(bloque).style.display=VISIBLE; /*Que mueste el div id='bloque2'*/
	  document.getElementById('bloque').style.display=OCULTO;
	  document.getElementById('bloque2').style.display=OCULTO; 
	  document.getElementById('bloque3').style.display=OCULTO; 
      document.getElementById('bloque5').style.display=OCULTO;
	  document.getElementById('bloque6').style.display=OCULTO; 
	  document.getElementById('bloque7').style.display=OCULTO; 
	  document.getElementById('bloque8').style.display=OCULTO; 
	  document.getElementById('bloque9').style.display=OCULTO;
	  document.getElementById('bloqueA').style.display=OCULTO;	
	  document.getElementById('bloqueB').style.display=OCULTO;	
	  }
	   if(bloque=='bloque5'){ /*Si al que le dio clik fue al link 2 _(Historial 2 en este caso) que muestre el div id='bloque2'*/
	  document.getElementById(bloque).style.display=VISIBLE; /*Que mueste el div id='bloque2'*/
	  document.getElementById('bloque').style.display=OCULTO;
	  document.getElementById('bloque2').style.display=OCULTO;
	  document.getElementById('bloque3').style.display=OCULTO; 
	  document.getElementById('bloque4').style.display=OCULTO;
	  document.getElementById('bloque6').style.display=OCULTO; 
	  document.getElementById('bloque7').style.display=OCULTO; 
	  document.getElementById('bloque8').style.display=OCULTO; 
	  document.getElementById('bloque9').style.display=OCULTO;
	  document.getElementById('bloqueA').style.display=OCULTO;
	  document.getElementById('bloqueB').style.display=OCULTO;		
	  }
 	   if(bloque=='bloque6'){ /*Si al que le dio clik fue al link 2 _(Historial 2 en este caso) que muestre el div id='bloque2'*/
	  document.getElementById(bloque).style.display=VISIBLE; /*Que mueste el div id='bloque2'*/
	  document.getElementById('bloque').style.display=OCULTO;
	  document.getElementById('bloque2').style.display=OCULTO;
	  document.getElementById('bloque3').style.display=OCULTO; 
	  document.getElementById('bloque4').style.display=OCULTO;
	  document.getElementById('bloque5').style.display=OCULTO; 
	  document.getElementById('bloque7').style.display=OCULTO; 
	  document.getElementById('bloque8').style.display=OCULTO; 
	  document.getElementById('bloque9').style.display=OCULTO;
	  document.getElementById('bloqueA').style.display=OCULTO;
	  document.getElementById('bloqueB').style.display=OCULTO;		
	  }
	  if(bloque=='bloque7'){ /*Si al que le dio clik fue al link 2 _(Historial 2 en este caso) que muestre el div id='bloque2'*/
	  document.getElementById(bloque).style.display=VISIBLE; /*Que mueste el div id='bloque2'*/
	  document.getElementById('bloque').style.display=OCULTO;
	  document.getElementById('bloque2').style.display=OCULTO;
	  document.getElementById('bloque3').style.display=OCULTO; 
	  document.getElementById('bloque4').style.display=OCULTO;
	  document.getElementById('bloque5').style.display=OCULTO; 
	  document.getElementById('bloque6').style.display=OCULTO; 
	  document.getElementById('bloque8').style.display=OCULTO; 
	  document.getElementById('bloque9').style.display=OCULTO;
	  document.getElementById('bloqueA').style.display=OCULTO;
	  document.getElementById('bloqueB').style.display=OCULTO;		
	  }
	   if(bloque=='bloque8'){ /*Si al que le dio clik fue al link 2 _(Historial 2 en este caso) que muestre el div id='bloque2'*/
	  document.getElementById(bloque).style.display=VISIBLE; /*Que mueste el div id='bloque2'*/
	  document.getElementById('bloque').style.display=OCULTO;
	  document.getElementById('bloque2').style.display=OCULTO;
	  document.getElementById('bloque3').style.display=OCULTO; 
	  document.getElementById('bloque4').style.display=OCULTO;
	  document.getElementById('bloque5').style.display=OCULTO; 
	  document.getElementById('bloque6').style.display=OCULTO; 
	  document.getElementById('bloque7').style.display=OCULTO; 
	  document.getElementById('bloque9').style.display=OCULTO;
	  document.getElementById('bloqueA').style.display=OCULTO;
	  document.getElementById('bloqueB').style.display=OCULTO;		
	  }	  
	   if(bloque=='bloque9'){ /*Si al que le dio clik fue al link 2 _(Historial 2 en este caso) que muestre el div id='bloque2'*/
	  document.getElementById(bloque).style.display=VISIBLE; /*Que mueste el div id='bloque2'*/
	  document.getElementById('bloque').style.display=OCULTO;
	  document.getElementById('bloque2').style.display=OCULTO;
	  document.getElementById('bloque3').style.display=OCULTO; 
	  document.getElementById('bloque4').style.display=OCULTO;
	  document.getElementById('bloque5').style.display=OCULTO; 
	  document.getElementById('bloque6').style.display=OCULTO; 
	  document.getElementById('bloque7').style.display=OCULTO; 
	  document.getElementById('bloque8').style.display=OCULTO;
	  document.getElementById('bloqueA').style.display=OCULTO;
	  document.getElementById('bloqueB').style.display=OCULTO;		
	  }
	   if(bloque=='bloqueA'){ /*Si al que le dio clik fue al link 2 _(Historial 2 en este caso) que muestre el div id='bloque2'*/
	  document.getElementById(bloque).style.display=VISIBLE; /*Que mueste el div id='bloque2'*/
	  document.getElementById('bloque').style.display=OCULTO;
	  document.getElementById('bloque2').style.display=OCULTO;
	  document.getElementById('bloque3').style.display=OCULTO; 
	  document.getElementById('bloque4').style.display=OCULTO;
	  document.getElementById('bloque5').style.display=OCULTO; 
	  document.getElementById('bloque6').style.display=OCULTO; 
	  document.getElementById('bloque7').style.display=OCULTO; 
	  document.getElementById('bloque8').style.display=OCULTO;
	  document.getElementById('bloque9').style.display=OCULTO;
	  document.getElementById('bloqueB').style.display=OCULTO;		
	  }
	  if(bloque=='bloqueB'){ /*Si al que le dio clik fue al link 2 _(Historial 2 en este caso) que muestre el div id='bloque2'*/
	  document.getElementById(bloque).style.display=VISIBLE; /*Que mueste el div id='bloque2'*/
	  document.getElementById('bloque').style.display=OCULTO;
	  document.getElementById('bloque2').style.display=OCULTO;
	  document.getElementById('bloque3').style.display=OCULTO; 
	  document.getElementById('bloque4').style.display=OCULTO;
	  document.getElementById('bloque5').style.display=OCULTO; 
	  document.getElementById('bloque6').style.display=OCULTO; 
	  document.getElementById('bloque7').style.display=OCULTO; 
	  document.getElementById('bloque8').style.display=OCULTO;
	  document.getElementById('bloque9').style.display=OCULTO;
	  document.getElementById('bloqueA').style.display=OCULTO;		
	  }
}

function prueba() {
	var tex1= document.getElementById('usuario_clave').value;
	var tex2= document.getElementById('usuario_clave2').value;
	if (tex1 != tex2) {
		document.getElementById('usuario_clave').value='';
		document.getElementById('usuario_clave2').value='';
		document.getElementById('usuario_clave').focus();
		alert('los datos introducidos no son coincidentes');
		
    }
}

