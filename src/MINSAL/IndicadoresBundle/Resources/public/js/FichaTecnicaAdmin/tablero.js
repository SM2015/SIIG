$(document).ready(function() {
    jQuery(document).ajaxStart(function() {
        $('#div_carga').show();
    }).ajaxStop(function() {
        $('#div_carga').hide();
    });

    $('A.indicador').click(function() {
        var zona_g = $('DIV.zona_actual').attr('id');
        $('#' + zona_g + ' .controles').html('');
        $('#' + zona_g + ' .filtros_dimensiones').attr('data', '');
        $('#' + zona_g + ' .filtros_dimensiones').html('');
        recuperarDimensiones($(this).attr('data-id'), zona_g);
    });

    $('#agregar_fila').click(function() {
        sala_agregar_fila();
    });
    /*var $window = $(window);
     $('#menu_sala').affix({
     offset: {
     top: function () { return $window.width() <= 980 ? 290 : 160 }
     },
     top: 100
     }); */
    function ver_ficha_tecnica(id_indicador) {
        $.get(Routing.generate('get_indicador_ficha', {id: id_indicador}));
    }

    $('DIV.area_grafico').click(function() {
        zona_elegir(this);
    });

    function zona_elegir(zona) {
        $('DIV.zona_actual').removeClass('zona_actual');
        $(zona).addClass('zona_actual');
    }

    function sala_agregar_fila() {
        var html = '<div class="row-fluid" >';
        var cant = $('DIV.area_grafico').length;
        for (i = cant + 1; i <= cant + 3; i++) {
            html +=
                    '<div class="span4 area_grafico" id="grafico_' + i + '" >' +
                    '<h3 class="titulo_indicador"></h3>' +
                    '<h6 class="filtros_dimensiones"></h6>' +
                    '<div class="controles btn-toolbar"></div>' +
                    '<div class="row-fluid info" ></div>' +
                    '<div class="row-fluid" >' +
                    '<div class="grafico" ></div>' +
                    '</div>' +
                    '<div class="row-fluid" >' +
                    '<div class="span4 dimension" style="text-align: right"></div>' +
                    '<div class="controlesDimension span4"></div>' +
                    '</div>' +
                    '</div>';
        }
        html += '</div>';
        $('div.sala').append(html);
        $('DIV.area_grafico').click(function() {
            zona_elegir(this);
        });
    }

    $('#guardar_sala').click(function() {
        var arreglo_indicadores = [];
        var datos_sala = new Object();

        var nombre_sala = $('#nombre_sala').val();
        if (nombre_sala === '') {
            alert('Ingrese un nombre de sala');
            return;
        }
        var i = 0;
        $('.area_grafico').each(function() {
            if ($(this).children('.titulo_indicador').html() !== '') {
                var datos = new Object();
                datos.id_indicador = $(this).children('.titulo_indicador').attr('data-id');
                datos.filtros = $(this).children('.filtros_dimensiones').attr('data');
                datos.dimension = $('#' + $(this).attr('id') + ' .dimensiones').val();
                datos.tipo_grafico = $('#' + $(this).attr('id') + ' .tipo_grafico_principal').val();
                datos.posicion = $(this).attr('id').split('_')[1];
                arreglo_indicadores[i] = datos;
            }
            i++;
        });

        datos_sala.nombre = $('#nombre_sala').val();
        datos_sala.id = $('#nombre_sala').attr('id-sala');
        datos_sala.datos_indicadores = arreglo_indicadores;

        $.getJSON(Routing.generate('sala_guardar'), {datos: JSON.stringify(datos_sala)},
        function(resp) {
           if(resp.estado === 'ok'){
               $('#nombre_sala').attr('id-sala', resp.id_sala);
               $('#nombre_sala2').html('<h4>Nombre de sala: '+$('#nombre_sala').val()+'</h4>');
               $('#myModal').modal('toggle');
               //$('#info_sala').html('_sala_guardada_').addClass('success');
           }
           else{
               $('#info_sala').html('_error_guardar_sala_').addClass('error');
           }
               
        });
    });
});