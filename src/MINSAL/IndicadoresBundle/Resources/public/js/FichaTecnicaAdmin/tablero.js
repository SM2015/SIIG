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
                combo_tipo_grafico += "</SELECT>";
                
                var combo_ordenar_por_dimension = trans.ordenar_dimension+": <SELECT id='ordenar_dimension'>"+
                        "<OPTION VALUE='-1'></OPTION>"+
                        "<OPTION VALUE='desc'>"+trans.descendente+"</OPTION>"+
                        "<OPTION VALUE='asc'>"+trans.ascendente+"</OPTION>"+
                        "</SELECT>";
                var combo_ordenar_por_medida = trans.ordenar_medida+": <SELECT id='ordenar_medida'>"+
                        "<OPTION VALUE='-1'></OPTION>"+
                        "<OPTION VALUE='desc'>"+trans.descendente+"</OPTION>"+
                        "<OPTION VALUE='asc'>"+trans.ascendente+"</OPTION>"+
                        "</SELECT>";
                var filtro_posicion = trans.filtro_posicion +" "+trans.desde+
                        "<INPUT class='valores_filtro' id='filtro_desde' type='text' length='5' value=''> "+trans.hasta +
                        "<INPUT class='valores_filtro' id='filtro_hasta' type='text' length='5' value=''> "+
                        "<input type='button' id='aplicar_filtro' value='"+trans.filtrar+"'/>"+
                        "<input type='button' id='quitar_filtro' value='"+trans.quitar_filtro+"'/>";
                $('#controles').append(combo_dimensiones);
                $('#controles').append(combo_tipo_grafico);
                $('#controles').append(combo_ordenar_por_dimension);
                $('#controles').append(combo_ordenar_por_medida);
                $('#controles').append(filtro_posicion);
                
                $('#ordenar_dimension').change(function(){
                    ordenarDatos('dimension', $(this).val());
                });
                $('#ordenar_medida').change(function(){
                    ordenarDatos('medida', $(this).val());
                });
                $('#dimensiones').change(function(){
                    $('#ordenar_dimension').children('option[value="-1"]').attr('selected','selected');
                    $('#ordenar_medida').children('option[value="-1"]').attr('selected','selected');
                    dibujarGrafico($(this).val());
                });
                $('#tipo_grafico_principal').change(function(){
                    dibujarGraficoPrincipal($(this).val());
                });
            
                $('#aplicar_filtro').click(function(){
                   aplicarFiltro(); 
                });
                $('#quitar_filtro').click(function(){
                   datasetPrincipal = datasetPrincipal_bk ;
                    dibujarGraficoPrincipal($('#tipo_grafico_principal').val());
                });
                dibujarGrafico($('#dimensiones').val());
            }

        });
    }

        
});