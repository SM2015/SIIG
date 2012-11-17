/*
 ################ FORMATS ##################
 -------------------------------------------
 */


var formatAsPercentage = d3.format("%"),
        formatAsPercentage1Dec = d3.format(".1%"),
        formatPercent = d3.format("%"),
        formatAsInteger = d3.format(","),
        fsec = d3.time.format("%S s"),
        fmin = d3.time.format("%M m"),
        fhou = d3.time.format("%H h"),
        fwee = d3.time.format("%a"),
        fdat = d3.time.format("%d d"),
        fmon = d3.time.format("%b")
        ;

var datasetPrincipal;

color = d3.scale.category20();    //builtin range of colors

function dibujarGraficoPrincipal(tipo) {
    if (tipo == null || tipo == 'pastel')
        dibujarGraficoPastel('graficoPrimario', datasetPrincipal);
    else if (tipo == 'columnas')
        dibujarGraficoColumnas('graficoPrimario', datasetPrincipal);
    else if (tipo == 'lineas')
        dibujarGraficoLineas('graficoPrimario', datasetPrincipal);
}

function ascenderNivelDimension(nivel){
    ruta ='';
    var ultimo;
    $filtro = $('#filtros_dimensiones');
    filtros_obj = jQuery.parseJSON($filtro.attr('data'));    
    
    var nuevo_filtro=[{}];
    $.each(filtros_obj, function (i, obj){
        
        if (i <= nivel){
            nuevo_filtro[i] = obj;
            if (i == nivel)
                ruta += obj.etiqueta + ': ' + obj.valor;
            else
                ruta += '<A href="#" data="'+i+'">'+obj.etiqueta + ': ' + obj.valor +'</A> / ';
        }
        else{
            // Los que estén a la derecha del seleccionado deben volver al control de dimensiones                        
            $('#dimensiones').append("<OPTION VALUE='"+obj.codigo+"'>"+obj.etiqueta+"</OPTION>");            
            if (i == parseInt(nivel) +1)
                primero = obj.codigo;
        }
    });
    
    //El primer elemento 
    $('#dimensiones').children('option[value="'+primero+'"]').attr('selected','selected');
    
    $filtro.html(ruta);
    $filtro.attr('data', JSON.stringify(nuevo_filtro));
    
    dibujarGrafico($('#dimensiones').val());
}
function descenderNivelDimension(category){
    if ($('#dimensiones option').length <= 1){
        alert('No hay más niveles para descender');
        return;        
    }
    var $dimension = $('#dimensiones option:selected');
    var $filtro = $('#filtros_dimensiones');
    var separador1='',
            separador2='';
    
    // Construir la cadena de filtros
    filtros = $filtro.attr('data');
    filtro_a_agregar = '{"codigo":"'+$dimension.val()+'",'+
                        '"etiqueta":"'+$dimension.html()+'",'+
                        '"valor":"'+category+'"'+
                        "}";
    
    if (filtros != '' && filtros != null)
        separador1 += ',';    
    else
        filtros='[';
    
    filtros = filtros.replace(']','');
    $filtro.attr('data', filtros+separador1+filtro_a_agregar+']');
    
    ruta ='';
    filtros_obj = jQuery.parseJSON($filtro.attr('data'));    
    cant_obj = filtros_obj.length;
    $.each(filtros_obj, function (i, obj){
        if (i == (cant_obj-1))
            ruta += obj.etiqueta + ': ' + obj.valor;
        else
            ruta += '<A href="#" data="'+i+'">'+obj.etiqueta + ': ' + obj.valor +'</A> / ';
    });
    
    $filtro.html(ruta);
    
    //Borrar la opcion del control de dimensiones
    $dimension.remove();
    
    $('#filtros_dimensiones A').click(function(){
        ascenderNivelDimension($(this).attr('data'));
    });
    
    dibujarGrafico($('#dimensiones').val());
}

function dibujarGrafico(dimension){        
    if (dimension==null)
        return;
    filtro = $('#filtros_dimensiones').attr('data');
    $.getJSON(Routing.generate('indicador_datos', 
        {id: $('#titulo_indicador').attr('data-id'), dimension: dimension}), 
        {filtro: filtro},
    function(resp){
        datasetPrincipal = resp.datos;
        dibujarGraficoPrincipal($('#tipo_grafico_principal').val());
    });
}