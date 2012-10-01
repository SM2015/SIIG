<?php
$cant_campos= 	(isset($_REQUEST['cant_campos'])) ? $_REQUEST['cant_campos'] : NULL;
if($cant_campos!=0){
print '--------------Nombre-------------/----------Tipo----------/Tama&ntilde;o<br/>';
	for ($i=1; $i<=$cant_campos; $i ++){
	?>
		<input name="nombre_campo<?php echo $i;?>" id="nombre_campo<?php echo $i;?>" size="50" title="Nombre del campo<?php echo $i;?>" maxlength="50"></input>
		<select name="tipo_campo<?php echo $i;?>" id="tipo_campo<?php echo $i;?>" title="Tipo de campo<?php echo $i;?>">
		<OPTION value="0" selected="selected">Seleccione Uno</OPTION>
			<OPTION value="1">Caracter</OPTION>
			<OPTION value="2">Numerico</OPTION>
                        <OPTION value="3">Fecha</OPTION>
		</select>
		<input name="tamano_campo<?php echo $i;?>" id="tamano_campo<?php echo $i;?>" size="3" title="Tama&ntilde;o del campo<?php echo $i;?>" maxlength="3" onkeypress='validate(event)'></input>
		<br/>
	<?php
	}
}
?>
<script type="text/javascript"> 
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
</script>