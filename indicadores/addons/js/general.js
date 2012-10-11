
function validate(evt) {
	var theEvent = evt || window.event;
	var key = theEvent.keyCode || theEvent.which;
	key = String.fromCharCode( key );
	var regex = /[0-9]|\./;
	if( !regex.test(key) ) {
		theEvent.returnValue = false;
		theEvent.preventDefault();
	}
}

function disp_confirm(urlOk, urlNo, text){
	var name=confirm(text)
	if (name==true){
		document.location.href=urlOk;
	}
}

function validarip() {
	errorString = "";
	theName = "Direccion IP ";
        var IPvalue = document.getElementById('ip').value
	var ipPattern = /^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/;
	var ipArray = IPvalue.match(ipPattern);
	if (IPvalue == "0.0.0.0")
		errorString = errorString + theName + ': '+IPvalue+' es una direccion IP especial y no puede usar aqui.';
	else if (IPvalue == "255.255.255.255")
		errorString = errorString + theName + ': '+IPvalue+' es una direccion IP especial y no puede usar aqui.';
	if (ipArray == null)
		errorString = errorString + theName + ': '+IPvalue+' no es una direccion IP valida.';
	else {
		for (i = 0; i < 4; i++) {
			thisSegment = ipArray[i];
			if (thisSegment > 255) {
				errorString = errorString + theName + ': '+IPvalue+' no es una direccion IP valida.';
				i = 4;
			}
			if ((i == 0) && (thisSegment > 255)) {
				errorString = errorString + theName + ': '+IPvalue+' es una direccion IP especial y no puede usar aqui.';
				i = 4;
			}
		}
	}
	extensionLength = 3;
	if (errorString == ""){
	}else{
		alert (errorString);
		document.getElementById('ip').focus();
	}
}

function valEmail(valor){
var em=valor.value;
    re=/^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,3})$/;
    if(!re.exec(em))    {
        alert('La direccion de correo electronico '+em+' es incorrecto');
    }else{
        return true;
    }
}

function valTel(valor){
var em=valor.value;
    re=/^[0-9]{4,4}-? ?[0-9]{4,4}$/;
    if(!re.exec(em))    {
        alert('El numero telefonico '+em+' es incorrecto');
    }else{
        return true;
    }
}
