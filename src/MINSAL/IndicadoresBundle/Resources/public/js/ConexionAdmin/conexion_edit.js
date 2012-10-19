$(document).ready(function(){   
    
    // Voy a ordenar unos controles que el AdminBundle no los saca bien
    // id que se está usando para los nombres de los formularios (es aleatorio)
    var $id = $('input[id$="_usuario"]').attr('id').split('_')[0];
    
    //Insertar justo despues de los controles para ingresar el nombre de usuario
    var $elem = $('#sonata-ba-field-container-'+$id+'_usuario');
    
    $elem.after("<div id='sonata-ba-field-container-"+$id+"_clave' "
                +"class= 'control-group' >"                
                +"<div>"
        )
    var $div1 = $('#sonata-ba-field-container-'+$id+'_clave');
    
    $div1.after("<div id='sonata-ba-field-container-"+$id+"_repetir_clave' "
                +"class= 'control-group' >"
                +"<div>"
        )
     var $div2 = $('#sonata-ba-field-container-'+$id+'_repetir_clave');
     
     //El campo de ingreso de clave lo insertaré en el DIV1
     $('label[for="'+$id+'_clave_first"]').appendTo($div1);
     $div1.append("<div class='controls sonata-ba-field sonata-ba-field-standard-natural ' id='aux1'></div>");     
     $('#'+$id+'_clave_first').appendTo('#aux1');
     
     // Ahora el campo para repetir la clave
     $('label[for="'+$id+'_clave_second"]').appendTo($div2);
     $div2.append("<div class='controls sonata-ba-field sonata-ba-field-standard-natural ' id='aux2'></div>");
     $('#'+$id+'_clave_second').appendTo('#aux2');
     
     // La barra con los botones de acción
     // Agregaré el de probar conexión     
     $('#btn_probar_conexion').appendTo('div .form-actions');
     $('#btn_probar_conexion').after("<span id='resultado_probar_conexion'></span>");
     
     $('#btn_probar_conexion').click(function(){
         /* A cada nombre de campo se le agrega como prefijo el id que se está usando 
          * para el formulario, lo quitaré para que sea más fácil de manipular del lado del servidor
         */
         var patron = new RegExp($id+"%5B","ig");
         var datos = $("form").serialize().replace(patron,'').replace(/%5D/ig,'').replace(/%5B/ig,'');                  
         
         $('#resultado_probar_conexion').load(Routing.generate('origen_dato_conexion_probar'), datos);

     })
});

