$(document).ready(function(){   
    //Borrar el botón para agregar y crear otro
    $('input[name$="btn_create_and_create"]').remove();
     
    //Si existe la capa configurar, cargar los datos    
    if ($('#configurar').length){
        $('#configurar').append('<div id="mensajito_cambio"></div><table border=1 align=center id="datos" class="table table-striped"></table>')
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
                $('#datos').append("<THEAD><TR id='fila_enc' class='info'></TR></THEAD>");
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
            }
            $('#configurar select').change(function(){
                var valor = $(this).attr('value');
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

