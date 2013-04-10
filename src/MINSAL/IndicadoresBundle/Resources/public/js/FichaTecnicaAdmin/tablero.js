$(document).ready(function() {
    jQuery(document).ajaxStart(function() {
        $('#div_carga').show();
    }).ajaxStop(function() {
        $('#div_carga').hide();
    });

    $('A.indicador').click(function() {
        dibujarIndicador($(this).attr('data-id'));
    });

    function dibujarIndicador(id_indicador) {
        recuperarDimensiones(id_indicador, null);
    }

    $('#agregar_fila').click(function() {
        sala_agregar_fila();
    });

    $('#quitar_indicador').click(function() {
        limpiarZona2($('DIV.zona_actual').attr('id'));
    });

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
        var cant = $('DIV.area_grafico').length;
        var html = '<div class="row-fluid fila_sala" >';
        for (var ii = cant + 1; ii <= cant + 3; ii++) {
            html = html + 
                    '<div class="span4 area_grafico" id="grafico_' + ii + '" >' +
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
        
        $('#sala').append(html);
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
                var elementos = [];
                $('#'+ $(this).attr('id') +' .capa_dimension_valores input:checked').each(function() {
                    elementos.push($(this).val());
                }); 
                
                datos.id_indicador = $(this).children('.titulo_indicador').attr('data-id');
                datos.filtros = $(this).children('.filtros_dimensiones').attr('data');
                datos.filtro_desde = $('#'+$(this).attr('id')+' .filtro_desde').val();
                datos.filtro_hasta = $('#'+$(this).attr('id')+' .filtro_hasta').val();
                datos.filtro_elementos = elementos.toString();
                datos.dimension = $('#' + $(this).attr('id') + ' .dimensiones').val();
                datos.tipo_grafico = $('#' + $(this).attr('id') + ' .tipo_grafico_principal').val();
                datos.orden = $(this).attr('orden');
                datos.posicion = $(this).attr('id').split('_')[1];
                arreglo_indicadores[i] = datos;
                i++;
            }

        });
        datos_sala.nombre = $('#nombre_sala').val();
        datos_sala.id = $('#nombre_sala').attr('id-sala');
        datos_sala.datos_indicadores = arreglo_indicadores;

        $.getJSON(Routing.generate('sala_guardar'), {datos: JSON.stringify(datos_sala)},
        function(resp) {
            if (resp.estado === 'ok') {
                $('#nombre_sala').attr('id-sala', resp.id_sala);
                $('#nombre_sala2').html('<h4>Nombre de sala: ' + $('#nombre_sala').val() + '</h4>');
                $('#myModal').modal('toggle');
                //$('#info_sala').html('_sala_guardada_').addClass('success');
            }
            else {
                $('#info_sala').html('_error_guardar_sala_').addClass('error');
            }

        });
    });

    $('.salas-id').click(function() {
        $('#nombre_sala').attr('id-sala', $(this).attr('sala-id'));
        $('#nombre_sala').val($(this).attr('sala-nombre'));
        $('#nombre_sala2').html('<h4>Nombre de sala: ' + $(this).attr('sala-nombre') + '</h4>');

        var graficos = JSON.parse($(this).attr('data'));
        var max_id = 0;
        for (i = 0; i < graficos.length; i++) {
            if (parseInt(graficos[i].posicion) > max_id)
                max_id = graficos[i].posicion;
        }

        $('.fila_sala').remove();

        var filas = Math.ceil(max_id / 3);
        for (i = 1; i <= filas; i++) {
            sala_agregar_fila();
        }

        for (i = 0; i < graficos.length; i++) {
            $('DIV.zona_actual').removeClass('zona_actual');
            $('#grafico_' + graficos[i].posicion).addClass('zona_actual');

            recuperarDimensiones(graficos[i].idIndicador, graficos[i]);
        }
    });   
});