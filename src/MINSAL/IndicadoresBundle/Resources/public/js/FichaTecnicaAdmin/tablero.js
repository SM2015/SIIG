$(document).ready(function() {
    jQuery(document).ajaxStart(function() {
        $('#div_carga').show();
    }).ajaxStop(function() {
        $('#div_carga').hide();
    });    

    $('A.indicador').click(function() {
        $('#controles').html('');
        $('#filtros_dimensiones').html('').attr('data', '');

        recuperarDimensiones($(this).attr('data-id'));
    });
   

    function ver_ficha_tecnica(id_indicador){ 
        $.get(Routing.generate('get_indicador_ficha',{id: id_indicador}));
    }


});