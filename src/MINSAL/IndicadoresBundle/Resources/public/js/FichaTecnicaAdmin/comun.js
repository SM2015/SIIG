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
var datasetPrincipal_bk;
var rangos_alertas;

color = d3.scale.category20();    //builtin range of colors

function colores_alertas (indice, i){
    if (rangos_alertas.length == 0)        
        return color(i);
    else{
        for (i=0; i <rangos_alertas.length; i++){            
            if(indice<=rangos_alertas[i].limite_sup)
                return rangos_alertas[i].color
        }
        return 'lightblue';        
    }
}

function dibujarGraficoPrincipal(tipo) {
    $('#dimension').html('<h4>'+$('#dimensiones option:selected').html()+'</h4>');
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
    $('#ordenar_dimension').children('option[value="-1"]').attr('selected','selected');
    $('#ordenar_medida').children('option[value="-1"]').attr('selected','selected');
    //filtros();
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
    $('#ordenar_dimension').children('option[value="-1"]').attr('selected','selected');
    $('#ordenar_medida').children('option[value="-1"]').attr('selected','selected');
    //filtros()
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
        datasetPrincipal_bk = datasetPrincipal;
        dibujarGraficoPrincipal($('#tipo_grafico_principal').val());        
        controles_filtros();
    });
    
}

function ordenarDatos(ordenar_por, modo_orden){
    if (modo_orden=='-1')
        return;
    if (ordenar_por=='dimension')
        $('#ordenar_medida').children('option[value="-1"]').attr('selected','selected');
    else
        $('#ordenar_dimension').children('option[value="-1"]').attr('selected','selected');
    $.post(Routing.generate('indicador_datos_ordenar'),          
        {datos: datasetPrincipal, ordenar_por: ordenar_por, modo: modo_orden},
    function(resp){        
        datasetPrincipal = resp.datos;
        //datasetPrincipal_bk = datasetPrincipal;
        dibujarGraficoPrincipal($('#tipo_grafico_principal').val());
    },'json');
}

function aplicarFiltro(){
    var elementos='';
    $('#capa_dimension_valores input:checked').each(function(){
       elementos += $(this).val()+'&';
    });
    $.post(Routing.generate('indicador_datos_filtrar'),          
        {datos: datasetPrincipal, desde: $('#filtro_desde').val(), hasta: $('#filtro_hasta').val(),
        elementos: elementos},
    function(resp){        
        datasetPrincipal = resp.datos;
        dibujarGraficoPrincipal($('#tipo_grafico_principal').val());
    },'json');
}

function controles_filtros(){
    var lista_datos_dimension = '<DIV class="span2" id="capa_dimension_valores">'+trans.filtrar_por_elemento;
    
    $.each(datasetPrincipal, function(i, dato){
        lista_datos_dimension += '<li><input class="detenerclic" type="checkbox" id="categorias_a_mostrar'+i+'" '+
                    'name="categorias_a_mostrar[]" value="'+dato.category+'" /><label class="detenerclic" for="categorias_a_mostrar'+i+'" >'+dato.category+'</label></li>';
    });
    lista_datos_dimension += '</DIV><DIV class="span2"><input type="button" id="aplicar_filtro" value="'+trans.filtrar+'"/>'+
                        '<input type="button" id="quitar_filtro" value="'+trans.quitar_filtro+'"/></DIV>';
    
    $('#lista_datos_dimension').html('');
    $('#lista_datos_dimension').append(lista_datos_dimension);
    
    $('.detenerclic').click(function(event){
        event.stopPropagation();
        //ordenarDatos($(this).attr('data-ordenar-por'), $(this).attr('data-tipo-orden'));                    
    })
    $('#aplicar_filtro').click(function(){
        aplicarFiltro(); 
     });
    $('#quitar_filtro').click(function(){
        $('#filtro_desde').val('');
        $('#filtro_hasta').val('');
        $('#capa_dimension_valores input:checked').each(function(){
            $(this).attr('checked',false);
        });
         datasetPrincipal = datasetPrincipal_bk ;
        dibujarGraficoPrincipal($('#tipo_grafico_principal').val());
     });
}