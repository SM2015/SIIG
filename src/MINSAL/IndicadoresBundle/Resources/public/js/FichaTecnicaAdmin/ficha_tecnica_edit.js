$(document).ready(function() {
    // id que se está usando para los nombres de los formularios (es aleatorio)
    var $campos = $('textarea[id$="_camposIndicador"]');
    //$('DIV[id$="_camposIndicador"]').hide();
    $campos.hide();

    var campos_list = $campos.html().split(',');

    var listado = '<UL id="campos_orden">';
    $.each(campos_list, function(i, nodo) {
        listado += '<ol class="ui-state-default" data="' + nodo + '"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>' + nodo + '</ol>';
    });
    listado += '</UL>';
    $campos.parent().append(listado);

    $("#campos_orden").sortable({
        stop: function(event, ui) {
            cambiar_orden();
        }
    });

    //Al seleccionar una variable pasarla al campo de la fórmula
    $('ul[id$="_variables"] input[type=checkbox]').change(function() {        
        var variable = $.trim($(this).next('span').html()).match(/(\([0-9A-Z_]+\)$)/g);        
        variable = variable[0].replace('(','{').replace(')','}');        
        
        if ($(this).is(':checked'))
            $("input[id$='_formula']").atCaret('insert', variable);
        else
            $("input[id$='_formula']").val($("input[id$='_formula']").val().replace(variable, ''));

    });

    //Verificar que cuando se elija la clasificación técnica
    // solo se pueda marcar uno por categoría
    $('ul[id$="_clasificacionTecnica"] input:checkbox').change(function() {
        var categoria, $cambiar;
        //Si está marcado desmarcar todos los demas de la misma categoria
        var id = $(this).attr('id');
        if ($(this).is(':checked')) {
            categoria = $(this).next('span').html().split(' -- ')[0];
            //Seleccionar todos los demás de la misma categoría
            $cambiar = $('ul[id$="_clasificacionTecnica"] input:checkbox + span:contains(' + categoria + ')');
            $cambiar.each(function(i, nodo) {
                if ($(nodo).prev('input:checkbox').attr('id') !== id)
                    $(nodo).prev('input:checkbox').attr('checked', false);
            });
        }
    });

    function cambiar_orden() {
        var campos_nvo_orden = '';
        $("#campos_orden").children().each(function(i, nodo) {
            campos_nvo_orden += $(nodo).attr('data') + ',';
        });

        $campos.html(campos_nvo_orden.substring(0, campos_nvo_orden.length - 1));
    }

    alertas_aplicar_estilos();
    $('div[id$=_alertas]').on('sonata.add_element', function(event) {
        alertas_aplicar_estilos();
    });
    
    function alertas_aplicar_estilos(){
        $('div[id$=_alertas] select[id$=_color]').css('width','150px');
        $('div[id$=_alertas] textarea[id$=_comentario]').css('width','350px');
    }
      
});

