$(document).ready(function(){   
    $('select').click(function(){
        var nombre = $('option:selected', this).html();
        var clase_select = $(this).attr('class'); 
        var clase = $('option:selected', this).attr('class');
        
        // Asignar el nombre del campo fusionado, usando el nombre del seleccionado
        $('#'+clase_select).val(nombre);
        
        // Buscar en el otro origen de dato una correspondencia exacta        
        $('.'+clase).each(function(i,control){
            $(this).attr('selected',true);
        });
    })
});