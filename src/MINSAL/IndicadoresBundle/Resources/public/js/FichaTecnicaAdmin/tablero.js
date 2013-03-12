$(document).ready(function() {
    jQuery(document).ajaxStart(function() {
        $('#div_carga').show();
    }).ajaxStop(function() {
        $('#div_carga').hide();
    });    

    $('A.indicador').click(function() {        
        var zona_g = 'grafico_'+zona;                    
        $('#' + zona_g + ' .controles').html('');
        $('#' + zona_g + ' .filtros_dimensiones').attr('data','');
        $('#' + zona_g + ' .filtros_dimensiones').html('');
        recuperarDimensiones($(this).attr('data-id'));
    });
   

    function ver_ficha_tecnica(id_indicador){ 
        $.get(Routing.generate('get_indicador_ficha',{id: id_indicador}));
    }
    
    $('DIV.area_grafico').click(function(){
       var zona_elegida = $(this).attr('id').split('_');
       zona = zona_elegida[1];
       $('DIV.zona_actual').removeClass('zona_actual');
       $(this).addClass('zona_actual');
    });


});