$(document).ready(function(){
    // id que se está usando para los nombres de los formularios (es aleatorio)
    var $id = $('select[id$="_idConexion"]').attr('id').split('_')[0];
    
    // La barra con los botones de acción
    // Agregaré el de probar conexión     
    $('#btn_probar_sentencia').appendTo('div .form-actions');
    $('div .form-actions').after('<div ><table border=1 align=center id="datos" ></table></div>')
    $('#btn_probar_sentencia').after("<span id='resultado_probar_consulta'></span>");
     
    $('#btn_probar_sentencia').click(function(){
        /* A cada nombre de campo se le agrega como prefijo el id que se está usando 
         * para el formulario, lo quitaré para que sea más fácil de manipular del lado del servidor
        */       
        var patron = new RegExp($id+"%5B","ig");
        var datos = $("form").serialize().replace(patron,'').replace(/%5D/ig,'').replace(/%5B/ig,'');                  
        
        //Limpiar la tabla de datos
        $('#datos').html('');
                
        $.getJSON(Routing.generate('origen_dato_conexion_probar_sentencia'), datos, function(resp){            
            $('#resultado_probar_consulta').html(resp.mensaje);
            
            // Los encabezados de la fila
            $('#datos').append("<TR id='fila_enc'></TR>");
            $.each(resp.datos[0], function(nombre_campo){
                $('#fila_enc').append("<TH>"+nombre_campo+"</TH>");
            })
            
            //Los datos
            $.each(resp.datos, function(indice,fila){
                $('#datos').append("<TR id='fila"+indice+"'></TR>");
                $.each(fila, function(i, campo){
                    $('#fila'+indice).append("<TD>"+campo+"</TD>");
                })
            })
            
        });

    })
});

