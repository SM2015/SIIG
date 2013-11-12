
$(document).ready(function() {
    // *****************
    //Con esto se verifica el comportamiento del area de gráfico
    //Si se despliega algún menú dentro del gráfico se modifica un atributo
    //ccs para que se muestre correctamente se regresa a su modo normal cuando el menú se cierra
    //para esto fue necesario reescribir unos métodos de jQuery
    (function(){
        var methods = ["addClass", "toggleClass", "removeClass"]; //métodos a sobreescribir
        $.map(methods, function(method){
            var originalMethod = $.fn[ method ];            
            $.fn[ method ] = function(){                
                var result = originalMethod.apply( this, arguments ); // Execute the original method.                
                myfunction(this); // call your function                
                return result; // return the original result
            };
        });
    })();
    
    function myfunction(obj){
        if($(obj).hasClass('sobre_div'))
            if ($(obj).hasClass('open'))
                $('.zona_actual').css('overflow-y','visible');            
            else
                $('.area_grafico').filter(function(){ return $(this).css('overflow-y') === 'visible';}).css('overflow-y','auto');        
    }    
    // *****************
    
    jQuery(document).ajaxStart(function() {
        $('#div_carga').show();
    }).ajaxStop(function() {
        $('#div_carga').hide();
    });
            
    $( "#sala" ).sortable({
        handle: '.titulo',                
    });
    $( "#sala" ).disableSelection();
        
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
        var html =  '<div class="area_grafico" id="grafico_' + parseInt(cant+1) + '" >' +
                        "<DIV class= 'titulo'><span class='titulo_indicador '></span>"+
                            "<span>("+trans.por+" <span class='dimension' ></span>)</span>"+
                        '</DIV>'+
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
                $('#'+ $(this).attr('id') +' .capa_dimension_valores input:checked').each(function() {
                    elementos.push($(this).val());
                }); 
                
                datos.id_indicador = $(this).find('.titulo_indicador').attr('data-id');
                datos.filtros = $(this).find('.filtros_dimensiones').attr('data');
                datos.filtro_desde = $('#'+$(this).attr('id')+' .filtro_desde').val();
                datos.filtro_hasta = $('#'+$(this).attr('id')+' .filtro_hasta').val();
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
                $('#nombre_sala2').html('<h4>Nombre de sala: ' + $('#nombre_sala').val() + '</h4>');
                $('#myModal').modal('toggle');
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
        var max_id = graficos.length;

        $('#sala').html('');
        var filas = Math.ceil(max_id / 3);
        for (i = 1; i <= max_id; i++) {
            sala_agregar_fila();
        }
        
        for (i = 0; i < graficos.length; i++) {
            $('DIV.zona_actual').removeClass('zona_actual');
            $('#grafico_' + (i+1)).addClass('zona_actual');
            recuperarDimensiones(graficos[i].idIndicador, null);
        }
    }); 
    
});
