$(document).ready(function() {
    capa = $("div.tablero .row-fluid");
    var posicion = capa.position();
    capa.css({'position': 'absolute',
        'bottom': '15px',
        'top': posicion.top});
    $('#tablero_indicadores').accordion({
        heightStyle: "fill"
    });

    $('#tablero_indicadores A').click(function() {
        $('#controles').html('');
        $('#filtros_dimensiones').html('').attr('data','');

        recuperarDimensiones($(this).attr('id'));
    });
    var $tit_categoria = $('#tablero_indicadores h4');

    var espacio_tit_categoria = $tit_categoria.height() * 1.8 * $tit_categoria.length;

    $('#tablero_indicadores div').css({'max-height': capa.height() - espacio_tit_categoria});
    

    //dibujarGraficoPrincipal($('#tipo_grafico_primario').val());

    function recuperarDimensiones(id_indicador) {

        $.getJSON(
                Routing.generate('indicador_dimensiones', {id: id_indicador}),
        function(resp) {
            //Construir el campo con las dimensiones disponibles
            if (resp.resultado == 'ok') {
                $('#titulo_indicador').html(resp.nombre_indicador)
                        .attr('data-id',resp.id_indicador);
                var combo_dimensiones = trans.dimension+": <SELECT ID='dimensiones' name='dimensiones'>";
                $.each(resp.dimensiones, function(codigo, dimension){
                    combo_dimensiones +=  "<option value='"+codigo+"'>"+dimension+"</option>";
                });
                combo_dimensiones += "</SELECT>"
                
                var combo_tipo_grafico = trans.tipo_grafico+": <SELECT id='tipo_grafico_principal' name='tipo_grafico_principal' >";
                combo_tipo_grafico +=  "<OPTION VALUE='columnas'>Columnas</OPTION>"+
                    "<OPTION VALUE='pastel'>Pastel</OPTION>"+
                    "<OPTION VALUE='lineas'>Lineas</OPTION>";
                combo_tipo_grafico += "</SELECT>"
                $('#controles').append(combo_dimensiones);
                $('#controles').append(combo_tipo_grafico);
                $('#dimensiones').change(function(){
                    dibujarGrafico($(this).val());
                });
                $('#tipo_grafico_principal').change(function(){
                    dibujarGraficoPrincipal($(this).val());
                });
                dibujarGrafico($('#dimensiones').val());
            }

        });
    }

        
});