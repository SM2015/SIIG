$(document).ready(function(){   
    
    //****************** PARTE PARA PROBAR LA SENTENCIA SQL
    // id que se está usando para los nombres de los formularios (es aleatorio)
    var $id = $('select[id$="_idConexion"]').attr('id').split('_')[0];
    
    // La barra con los botones de acción
    // Agregaré el de probar conexión     
    $('#sonata-ba-field-container-'+$id+'_sentenciaSql').append($('#btn_probar_sentencia'));
    $('div .form-actions').after('<div ><table border=1 align=center id="datos" ></table></div>')
    $('#btn_probar_sentencia').after("<span id='resultado_probar_consulta'></span>");
     
    $('#btn_probar_sentencia').click(function(){
        /* A cada nombre de campo se le agrega como prefijo el id que se está usando 
         * para el formulario, lo quitaré para que sea más fácil de manipular del lado del servidor
        */       
        if ($('#'+$id+'_sentenciaSql').val() == ''){
            alert('No ha ingresado ninguna sentencia SQL');
            return
        }
            
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
    
    //************************** CÓDIGO PARA MOSTRAR EL RESULTADO PARA CONFIGURACIÓN DE CAMPOS
    
    //Borrar el botón para agregar
    $('input[name$="btn_create_and_create"]').remove();
     
    //Si existe la capa configurar, cargar los datos    
    if ($('#configurar').length){
        $('#configurar').append('<table border=1 align=center id="datos" class="table table-striped"></table>')
        $('#datos').before("<div id='mensajito_cambio'></div>");
        $.getJSON(Routing.generate('origen_dato_leer',{
            id: $('#configurar').attr('data')
        }), 
        function(resp){          
            //Construir los options de tipo_dato
            var tipos_datos = '<OPTION value=-1>Escoja el tipo de dato</OPTION>';
            $.each(resp.tipos_datos, function(indice, fila){              
                tipos_datos = tipos_datos +"<OPTION VALUE='"+fila.id+"' >"+fila.descripcion+"</OPTION>";
            });
            
            // Construir las opciones de significado de datos
            var significado_datos = '<OPTION value=-1>Elija el significado del dato</OPTION>';
            $.each(resp.significados, function(indice, fila){
                significado_datos = significado_datos +"<OPTION VALUE='"+fila.id+"'>"+fila.descripcion+"</OPTION>";
            });
            if (resp.datos.length > 0){
                // Los encabezados de la fila
                $('#datos').append("<CAPTION>Configure los campos: se muestra solo una parte de los datos</CAPTION><THEAD><TR id='fila_enc' class='info'></TR></THEAD>");
                $.each(resp.nombre_campos, function(id, valor){                    
                    nombre_columna = valor;
                    
                    tipos = "<SELECT id='tipo_campo__"+id+"' title='Elija el tipo de dato' >"+tipos_datos+"</SELECT>";
                    significados = "<SELECT id='significado_variable__"+id+"' title='Elija el significado del dato' >"+significado_datos+"</SELECT>";
                    $('#fila_enc').append("<TH>"+nombre_columna+'<BR>'+tipos+significados+"</TH>");
                })
            
                //Los datos
                $.each(resp.datos, function(indice,fila){
                    $('#datos').append("<TR id='fila"+indice+"'></TR>");
                    $.each(fila, function(i, campo){
                        $('#fila'+indice).append("<TD>"+campo+"</TD>");
                    })
                })
                
                //Elegir los valores que ya tienen, en el caso que esté modificando
                $.each(resp.campos, function(campo, fila){                    
                    $('#tipo_campo__'+fila.id).val(fila.tipo);
                    $('#significado_variable__'+fila.id).val(fila.significado);
                })
            }
            $('#datos select').change(function(){
                var valor = $(this).attr('value');
                if (valor == '-1'){
                    alert('Debe elegir un valor'); return false;
                }
                      
                var id_control = $(this).attr('id');
                var id_origen_dato = $('#configurar').attr('data')
                
                datos = {origen_dato: id_origen_dato,
                    control: id_control,
                    valor: valor
                };
                $.getJSON(Routing.generate('configurar_campo'), datos,
                    function(resp){ 
                        $('#mensajito_cambio').html(resp.mensaje);
                    })
            })   
            
        });
    }
     
});