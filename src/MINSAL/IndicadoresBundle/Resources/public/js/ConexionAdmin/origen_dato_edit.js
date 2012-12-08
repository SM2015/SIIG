$(document).ready(function(){   
    
    //****************** PARTE PARA PROBAR LA SENTENCIA SQL
    // id que se está usando para los nombres de los formularios (es aleatorio)
    if ($('select[id$="_conexion"]').length){
        var $id = $('select[id$="_conexion"]').attr('id').split('_')[0];
    
        // La barra con los botones de acción
        // Agregaré el de probar sentencia     
        $('#sonata-ba-field-container-'+$id+'_sentenciaSql').append($('#btn_probar_sentencia'));
        $('div .form-actions').after('<div ><table border=1 align=center id="datos" ></table></div>')
        $('#btn_probar_sentencia').after("<span id='resultado_probar_consulta'></span>");
     
        $('#btn_probar_sentencia').click(function(){
            /* A cada nombre de campo se le agrega como prefijo el id que se está usando 
         * para el formulario, lo quitaré para que sea más fácil de manipular del lado del servidor
        */       
            if ($('#'+$id+'_sentenciaSql').val() == '' || $('#'+$id+'_conexion').val() == ''){
                alert(trans.sentencia_sql_origen_requeridos);
                return;
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
    }
    //************************** CÓDIGO PARA MOSTRAR EL RESULTADO PARA CONFIGURACIÓN DE CAMPOS
    
    //Quitar los otros botones, solo debe estar agregar y editar
    $('input[name$="btn_create_and_create"]').remove();
    $('input[name$="btn_create_and_list"]').remove();    
     
    //Si existe la capa configurar, cargar los datos    
    if ($('#configurar').length){
        $('#configurar').append('<table id="datos"></table>');
        $('#datos').addClass("table table-condensed table-hover");
        $('#datos').before("<div id='mensajito_cambio'></div>");
        $.getJSON(Routing.generate('origen_dato_leer',{
            id: $('#configurar').attr('data')
        }), 
        function(resp){          
            //Construir los options de tipo_dato
            var tipos_datos = '';
            $.each(resp.tipos_datos, function(indice, fila){              
                seleccionado='';
                if (fila.codigo=='texto')
                    seleccionado='selected';
                tipos_datos = tipos_datos +"<OPTION VALUE='"+fila.id+"' "+seleccionado+">"+fila.descripcion+"</OPTION>";
            });
            
            // Construir las opciones de significado de datos
            var significado_datos = '<OPTION value=-1>'+trans.elija_significado_dato+'</OPTION>';
            $.each(resp.significados, function(indice, fila){
                significado_datos = significado_datos +"<OPTION data-significado_codigo='"+fila.codigo+"' VALUE='"+fila.id+"'>"+fila.descripcion+"</OPTION>";
            });
            
            // Los encabezados de la fila
            $('#datos').append("<CAPTION>"+trans.configure_campos+
                "</CAPTION>"+
                "<THEAD>"+
                "<TR id='fila_enc' class='info'>"+
                "<TH>"+trans.nombre_campo+"</TH>"+
                "<TH>"+trans.tipo+"</TH>"+
                "<TH>"+trans.significado+"</TH>"+
                "<TH>"+trans.datos_muestra+"</TH>"+
                "</TR></THEAD>"+
                "<TBODY id='datos_body'></TBODY>");
            $.each(resp.nombre_campos, function(id, valor){
                fila = "<TR>"+
                "<TD>"+valor+"</TD>"+
                "<TD>"+                   
                "<SELECT class='tipo_campo' id='tipo_campo__"+id+"' title='"+trans.elija_tipo_dato+"' >"+tipos_datos+"</SELECT>"+
                "</TD>"+
                "<TD>"+
                "<SELECT class='significado' data-significado_codigo='"+resp.campos[valor]['significado_codigo']+"' id='significado_variable__"+id+"' title='"+trans.elija_significado_dato+"' >"+significado_datos+"</SELECT>"+
                "</TD>"+
                "<TD>"+
                resp.datos[valor]+
                "</TD>"+
                "</TR>";
                $('#datos_body').append(fila);
            })
                
            //Elegir los valores que ya tienen, en el caso que esté modificando
            $.each(resp.campos, function(campo, fila){                    
                $('#tipo_campo__'+fila.id).val(fila.tipo);
                $('#significado_variable__'+fila.id).val(fila.significado);
            })
            
            
            /*o debe haber dos campos con el mismo significado
             Si se elije un significado se debe desactivar esa opcion de los demas
             Excepto si el origen es catálogo, en ese caso no se podrá repetir
             pk y descripcion
            */
            $('SELECT.significado').each(function(){
                if (resp.es_catalogo==false || (resp.es_catalogo && ($(this).attr('data-significado_codigo')=='pk' ||$(this).attr('data-significado_codigo')=='descripcion')))
                    $('SELECT.significado').not(this)
                    .children('option[value=' + this.value + ']')
                    .attr('disabled', true)
            });
            
            $('SELECT.significado').click(function () {
                $(this).data('previo',$(this).val())
            }).change(function() {
                var valor = $(this).attr('value');
                if (valor == '-1'){                    
                    $(this).children('option[value=' + $(this).data('previo') + ']').attr('selected', true);
                    alert(trans.debe_elegir_una_opcion);
                    return false;
                }
                
                //Cambiar el significado del select con el valor seleccionado
                sig =  $(this).children("option:selected").val();                
                $(this).attr('data-significado_codigo', sig);
                
                // Desabilitar en los otros controles
                if (resp.es_catalogo==false || (resp.es_catalogo && ($(this).attr('data-significado_codigo')=='pk' ||$(this).attr('data-significado_codigo')=='descripcion')))
                    $('SELECT.significado').not(this)
                    .children('option[value=' + this.value + ']')
                    .attr('disabled', true)
                
                // Si se ha hecho un cambio, activar el anterior valor
                if ($(this).data('previo'))
                    $('SELECT.significado').not(this)
                    .children('option[value=' + $(this).data('previo') + ']')
                    .attr('disabled', false)
                guardar_cambio($(this));
            });
            $('SELECT.tipo_campo').change(function(){
                guardar_cambio($(this));
            })
            
            $objs = $('SELECT.tipo_campo');
            $objs[parseInt($objs.length/2)].focus();
            
        });
    }
    
    function guardar_cambio(obj){
        var valor = obj.attr('value');
        
        var id_control = obj.attr('id');
        var id_origen_dato = $('#configurar').attr('data')
                
        datos = {
            origen_dato: id_origen_dato,
            control: id_control,
            valor: valor
        };
        $.getJSON(Routing.generate('configurar_campo'), datos,
            function(resp){ 
                $('#mensajito_cambio').html(resp.mensaje);
            })
    }
     
});