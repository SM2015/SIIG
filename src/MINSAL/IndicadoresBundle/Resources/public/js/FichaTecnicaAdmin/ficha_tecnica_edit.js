$(document).ready(function() {
    // id que se está usando para los nombres de los formularios (es aleatorio)
    var $campos = $('textarea[id$="_camposIndicador"]');
    //$('DIV[id$="_camposIndicador"]').hide();
    $campos.hide();

    var campos_list = $campos.html().split(',');
    //alert (campos_list);
    //campos_list = campos_list;
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

    //Verificar que cuando se elija la clasificación técnica
    // solo se pueda marcar uno por categoría
    $('ul[id$="_clasificacionTecnica"] input:checkbox').change(function() {
        var categoria, $cambiar;
        //Si está marcado desmarcar todos los demas de la misma categoria
        if ($(this).is(':checked')) {
            categoria = $(this).next('span').html().split(' -- ')[0];
            //Seleccionar todos los demás de la misma categoría
            $cambiar = $('ul[id$="_clasificacionTecnica"] input:checkbox + span:contains('+categoria+')');
            $cambiar.each(function(i, nodo){               
                $(nodo).prev('input:checkbox').attr('checked', false);
            });
            //Voler a marcar el recién seleccionado
            $(this).attr('checked', true);
        }
    });

    function cambiar_orden() {
        var campos_nvo_orden = '';
        $("#campos_orden").children().each(function(i, nodo) {
            campos_nvo_orden += $(nodo).attr('data') + ',';
        });

        $campos.html(campos_nvo_orden.substring(0, campos_nvo_orden.length - 1));
    }


});

