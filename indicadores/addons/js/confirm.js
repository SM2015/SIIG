
function disp_confirm(urlOk, urlNo, text){
	var name=confirm(text)
	if (name==true){
		document.location.href=urlOk;
	}

}

