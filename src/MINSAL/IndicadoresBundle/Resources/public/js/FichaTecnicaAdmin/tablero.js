
$(document).ready(function() {
    // *****************
    //Con esto se verifica el comportamiento del area de gráfico
    //Si se despliega algún menú dentro del gráfico se modifica un atributo
    //ccs para que se muestre correctamente se regresa a su modo normal cuando el menú se cierra
    //para esto fue necesario reescribir unos métodos de jQuery
    (function() {
        var methods = ["addClass", "toggleClass", "removeClass"]; //métodos a sobreescribir
        $.map(methods, function(method) {
            var originalMethod = $.fn[ method ];
            $.fn[ method ] = function() {
                var result = originalMethod.apply(this, arguments); // Execute the original method.                
                myfunction(this); // call your function                
                return result; // return the original result
            };
        });
    })();

    function myfunction(obj) {
        if ($(obj).hasClass('sobre_div'))
            if ($(obj).hasClass('open'))
                $('.zona_actual').css('overflow-y', 'visible');
            else
                $('.area_grafico').filter(function() {
                    return $(this).css('overflow-y') === 'visible';
                }).css('overflow-y', 'auto');
    }
    // *****************
    $('#myTab a').click(function(e) {
        e.preventDefault();
        $(this).tab('show');
    });
    $('#collapseOne').toggle();
    $('#aCollapseOne').click(function() {
        $('#collapseOne').toggle();
    });

    
    function ajax_states(){
        $(document).bind("ajaxStart.mine", function() {
            $('#div_carga').show();
        });
        $(document).bind("ajaxStop.mine", function() {
            $('#div_carga').hide();
        });
    }
    ajax_states();
    $("#sala").sortable({
        handle: '.titulo',
    });
    $("#sala").disableSelection();

    $('A.indicador').click(function() {
        if ($('DIV.zona_actual').attr('id') !== undefined){        
            dibujarIndicador($(this).attr('data-id'));
            moverAGraficoActual();
        } else {
            alert(trans._no_areas_grafico_);
        }        
    });

    function dibujarIndicador(id_indicador) {
        recuperarDimensiones(id_indicador, null);
    }

    $('#agregar_fila').click(function() {
        sala_agregar_fila();
    });

    $('#quitar_indicador').click(function() {
        limpiarZona2($('DIV.zona_actual').attr('id'));
        moverAGraficoActual();
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
        $('.zona_actual').removeClass('zona_actual');
        
        var html = '<div class="area_grafico zona_actual" id="grafico_' + parseInt(cant + 1) + '" >' +
                "<DIV class= 'titulo'><span class='titulo_indicador '></span>" +
                "<span>(" + trans.por + " <span class='dimension' ></span>)</span>" +
                '</DIV>' +
                '<h6 class="filtros_dimensiones"></h6>' +
                '<div class="controles btn-toolbar"></div>' +
                '<div class="row-fluid info" ></div>' +
                '<div class="row-fluid row_grafico" >' +
                '<div class="grafico" ></div>' +
                '</div>' +
                '</DIV>';

        
        $('#sala').append(html);
        $('DIV.area_grafico').click(function() {
            zona_elegir(this);
        });
        
        moverAGraficoActual();
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
        var posicion = 1;
        $('.area_grafico').each(function() {
            if ($(this).find('.titulo_indicador').html() !== '') {
                var datos = new Object();
                var elementos = [];
                $('#' + $(this).attr('id') + ' .capa_dimension_valores input:checked').each(function() {
                    elementos.push($(this).val());
                });

                datos.id_indicador = $(this).children('.titulo_indicador').attr('data-id');
                datos.filtros = $(this).children('.filtros_dimensiones').attr('data');
                datos.filtro_desde = $('#' + $(this).attr('id') + ' .filtro_desde').val();
                datos.filtro_hasta = $('#' + $(this).attr('id') + ' .filtro_hasta').val();
                datos.filtro_elementos = elementos.toString();
                datos.dimension = $('#' + $(this).attr('id') + ' .dimensiones').val();
                datos.tipo_grafico = $('#' + $(this).attr('id') + ' .tipo_grafico_principal').val();
                datos.orden = $(this).attr('orden');
                datos.posicion = posicion;
                arreglo_indicadores[i] = datos;
                i++;
            }
            posicion++;

        });
        datos_sala.nombre = $('#nombre_sala').val();
        datos_sala.id = $('#nombre_sala').attr('id-sala');
        datos_sala.datos_indicadores = arreglo_indicadores;

        $.getJSON(Routing.generate('sala_guardar'), {datos: JSON.stringify(datos_sala)},
        function(resp) {
            if (resp.estado === 'ok') {
                $('#nombre_sala').attr('id-sala', resp.id_sala);
                $('.marco-sala').attr('data-content', trans._nombre_sala_ + ': ' + $('#nombre_sala').val());
                $('#myModal').modal('toggle');
            }
            else {
                $('#info_sala').html('_error_guardar_sala_').addClass('error');
            }

        });
    });

    $('.salas-id').click(function() {
        $('.marco-sala').attr('id-sala', $(this).attr('sala-id'));
        $('.marco-sala').attr('data-content', trans._nombre_sala_ + ': ' + $(this).attr('sala-nombre'));
        $('#nombre_sala').attr('id-sala', $(this).attr('sala-id'));
        $('#nombre_sala').html($(this).attr('sala-nombre'));

        var graficos = JSON.parse($(this).attr('data'));
        var max_id = 0;
        for (i = 0; i < graficos.length; i++) {
            if (parseInt(graficos[i].posicion) > max_id)
                max_id = graficos[i].posicion;
        }

        $('#sala').html('');

        var filas = Math.ceil(max_id / 3);
        for (i = 1; i <= max_id; i++) {
            sala_agregar_fila();
        }

        for (i = 0; i < graficos.length; i++) {
            $('DIV.zona_actual').removeClass('zona_actual');
            $('#grafico_' + graficos[i].posicion).addClass('zona_actual');

            recuperarDimensiones(graficos[i].idIndicador, graficos[i]);
        }
        $('#myTab a:first').tab('show');
        $('#listado-salas li').removeClass('active');
        $('li[sala-id="' + $('.marco-sala').attr('id-sala') + '"]').addClass('active');
        
        cargarMensajes();
        cargarUsuarios();
    });

    function moverAGraficoActual() {
        $('#myTab a:first').tab('show');
        $('html, body').animate({
            scrollTop: $(".zona_actual").offset().top
        }, 2000);
    }

    function setScroll() {
        $('#chat-mensajes').animate({
            scrollTop: $("div.mensaje-sala:last")
        });
    }

    // Indicamos las acciones a ejecutar al enviar un mensaje
    $('#chat-form').submit(function() {
        if ($('.marco-sala').attr('id-sala')) {
            $.post(Routing.generate('sala_set_comentario', {id: $('.marco-sala').attr('id-sala')}), $('#chat-form').serialize(), function(data) {
                $('#chat-mensajes').append(data);   // Añadir el nuevo mensaje al final
                $('#chat-form-mensaje').val('');        // Limpiar el cuadro de texto
                setScroll();
            });
        }
        else {
            alert(trans._no_sala_);
        }
        return false;
    });

    $("#chat-mensajes").unbind("ajaxStart ajaxStop");

    function cargarMensajes() {
        if ($('.marco-sala').attr('id-sala')) {
            $('#chat-mensajes').load(
                    Routing.generate('sala_get_comentarios', {idSala: $('.marco-sala').attr('id-sala')}), {vez: 1},
            function(response, status, xhr) {                
                setScroll();                
            });
        }
    }
    
    function cargarUsuarios(){
        if ($('.marco-sala').attr('id-sala')) {
            $('#usuarios_sala').load(
                    Routing.generate('sala_get_usuarios', {idSala: $('.marco-sala').attr('id-sala')}),
            function(response, status, xhr) {
                $('.usuariosSala').change(function(){
                    var accion = ($(this).is(':checked')) ? 'agregar' : 'borrar';
                    $.get(Routing.generate('sala_set_usuario', 
                        {id: $('.marco-sala').attr('id-sala'), id_usuario: $(this).val(), accion: accion}
                    ));
                });
            });
        }
    }


    // Le indicamos cargar los mensajes cada minuto
    setInterval(function() {
        if ($('.marco-sala').attr('id-sala')) {
            $(document).unbind(".mine");
            $.post(Routing.generate('sala_get_comentarios', {idSala: $('.marco-sala').attr('id-sala')}), {vez: 2}, function(data) {
                if (data != ''){                    
                    $('#chat-mensajes').append(data);   // Añadir el nuevo mensaje al final
                    setScroll();
                }
            });
        }
    }, 60000);

});
