$(document).ready(function(){   
    $('select').click(function(){
        var nombre = $('option:selected', this).html();
        var clase_select = $(this).attr('class'); 
        var clase = $('option:selected', this).attr('class');
        
        // Asignar el nombre del campo fusionado, usando el nombre del seleccionado
        $('#'+clase_select).val(nombre);
        
        // Buscar en el otro origen de dato una correspondencia exacta        
        var option = $('option:selected', this);
        $('.'+clase).not(option).each(function(i,control){            
            var padre= $(this).parent();
            padre.data('previo',padre.val());
            $(this).attr('selected',true).change();
        });
        
        // Si usa un campo desactivarlo para que no se vuelva a utilizar
        $('select').click(function () {
            $(this).data('previo',$(this).val())
        }).change(function() { 
            var columna = $(this).parent().attr('class');
            // Desabilitar en los otros controles
            $('.'+columna+' > select').not(this)
                .children('option[value=' + this.value + ']')
                .attr('disabled', true)            
            // Se se ha hecho un cambio, activar el anterior valor
            if ($(this).data('previo'))
                $('.'+columna+' > select').not(this)
                    .children('option[value=' + $(this).data('previo') + ']')
                    .attr('disabled', false)
        });
    })
});