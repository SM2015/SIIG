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
/*
var datasetSecundario = [
    {group: "All", category: "Oranges", measure: 63850.4963},
    {group: "All", category: "Apples", measure: 78258.0845},
    {group: "All", category: "Grapes", measure: 60610.2355},
    {group: "All", category: "Figs", measure: 30493.1686},
    {group: "All", category: "Mangos", measure: 56097.0151},
    {group: "Sam", category: "Oranges", measure: 19441.5648},
    {group: "Sam", category: "Apples", measure: 25922.0864},
    {group: "Sam", category: "Grapes", measure: 9720.7824},
    {group: "Sam", category: "Figs", measure: 6480.5216},
    {group: "Sam", category: "Mangos", measure: 19441.5648},
    {group: "Peter", category: "Oranges", measure: 22913.2728},
    {group: "Peter", category: "Apples", measure: 7637.7576},
    {group: "Peter", category: "Grapes", measure: 23549.7526},
    {group: "Peter", category: "Figs", measure: 1909.4394},
    {group: "Peter", category: "Mangos", measure: 7637.7576},
    {group: "John", category: "Oranges", measure: 1041.5124},
    {group: "John", category: "Apples", measure: 2430.1956},
    {group: "John", category: "Grapes", measure: 15275.5152},
    {group: "John", category: "Figs", measure: 4166.0496},
    {group: "John", category: "Mangos", measure: 11803.8072},
    {group: "Rick", category: "Oranges", measure: 7406.3104},
    {group: "Rick", category: "Apples", measure: 2545.9192},
    {group: "Rick", category: "Grapes", measure: 1620.1304},
    {group: "Rick", category: "Figs", measure: 8563.5464},
    {group: "Rick", category: "Mangos", measure: 3008.8136},
    {group: "Lenny", category: "Oranges", measure: 7637.7576},
    {group: "Lenny", category: "Apples", measure: 35411.4216},
    {group: "Lenny", category: "Grapes", measure: 8332.0992},
    {group: "Lenny", category: "Figs", measure: 6249.0744},
    {group: "Lenny", category: "Mangos", measure: 11803.8072},
    {group: "Paul", category: "Oranges", measure: 3182.399},
    {group: "Paul", category: "Apples", measure: 867.927},
    {group: "Paul", category: "Grapes", measure: 1808.18125},
    {group: "Paul", category: "Figs", measure: 795.59975},
    {group: "Paul", category: "Mangos", measure: 578.618},
    {group: "Steve", category: "Oranges", measure: 2227.6793},
    {group: "Steve", category: "Apples", measure: 3442.7771},
    {group: "Steve", category: "Grapes", measure: 303.77445},
    {group: "Steve", category: "Figs", measure: 2328.93745},
    {group: "Steve", category: "Mangos", measure: 1822.6467},
]
        ;

var datasetLineChart = [
    {group: "All", category: 2008, measure: 289309},
    {group: "All", category: 2009, measure: 234998},
    {group: "All", category: 2010, measure: 310900},
    {group: "All", category: 2011, measure: 223900},
    {group: "All", category: 2012, measure: 234500},
    {group: "Sam", category: 2008, measure: 81006.52},
    {group: "Sam", category: 2009, measure: 70499.4},
    {group: "Sam", category: 2010, measure: 96379},
    {group: "Sam", category: 2011, measure: 64931},
    {group: "Sam", category: 2012, measure: 70350},
    {group: "Peter", category: 2008, measure: 63647.98},
    {group: "Peter", category: 2009, measure: 61099.48},
    {group: "Peter", category: 2010, measure: 87052},
    {group: "Peter", category: 2011, measure: 58214},
    {group: "Peter", category: 2012, measure: 58625},
    {group: "Rick", category: 2008, measure: 23144.72},
    {group: "Rick", category: 2009, measure: 14099.88},
    {group: "Rick", category: 2010, measure: 15545},
    {group: "Rick", category: 2011, measure: 11195},
    {group: "Rick", category: 2012, measure: 11725},
    {group: "John", category: 2008, measure: 34717.08},
    {group: "John", category: 2009, measure: 30549.74},
    {group: "John", category: 2010, measure: 34199},
    {group: "John", category: 2011, measure: 33585},
    {group: "John", category: 2012, measure: 35175},
    {group: "Lenny", category: 2008, measure: 69434.16},
    {group: "Lenny", category: 2009, measure: 46999.6},
    {group: "Lenny", category: 2010, measure: 62180},
    {group: "Lenny", category: 2011, measure: 40302},
    {group: "Lenny", category: 2012, measure: 42210},
    {group: "Paul", category: 2008, measure: 7232.725},
    {group: "Paul", category: 2009, measure: 4699.96},
    {group: "Paul", category: 2010, measure: 6218},
    {group: "Paul", category: 2011, measure: 8956},
    {group: "Paul", category: 2012, measure: 9380},
    {group: "Steve", category: 2008, measure: 10125.815},
    {group: "Steve", category: 2009, measure: 7049.94},
    {group: "Steve", category: 2010, measure: 9327},
    {group: "Steve", category: 2011, measure: 6717},
    {group: "Steve", category: 2012, measure: 7035}
]
      */  ;
color = d3.scale.category20();    //builtin range of colors

/*var group = "All";
var categoriaPrincipal = 0,
    indicePrincipal = 0;*/
/*function actualizarGraficosDependientes() {
    var datos_secundarios = datasetSecundarioChosen(categoriaPrincipal);
    var tipo_secundario = $('#tipo_grafico_secundario').val();
    
    dibujarGraficoSecundario(tipo_secundario, datos_secundarios, color(indicePrincipal), categoriaPrincipal)

    //updateLineChart(categoriaPrincipal, color(i));

}*/

/*function dibujarGraficoSecundario(tipo, datos, colorChoosen, categoryChoosen) {
    if (tipo == null || tipo == 'columnas')
        dibujarGraficoColumnas('graficoSecundario', datos, colorChoosen, categoryChoosen);
    else if (tipo == 'pastel')
        dibujarGraficoPastel('graficoSecundario', datos, colorChoosen, categoryChoosen);
    else if (tipo == 'lineas')
        dibujarGraficoLineas('graficoSecundario', datos, colorChoosen, categoryChoosen);
}*/
function dibujarGraficoPrincipal(tipo) {
    if (tipo == null || tipo == 'pastel')
        dibujarGraficoPastel('graficoPrimario', datasetPrincipal);
    else if (tipo == 'columnas')
        dibujarGraficoColumnas('graficoPrimario', datasetPrincipal);
    else if (tipo == 'lineas')
        dibujarGraficoLineas('graficoPrimario', datasetPrincipal);
}

/*function datasetSecundarioChosen(group) {
    var ds = [];
    for (x in datasetSecundario) {
        if (datasetSecundario[x].group == group) {
            ds.push(datasetSecundario[x]);
        }
    }
    return ds;
}*/

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
    filtro_a_agregar = '{"codigo":"'+$dimension.val()+'", '+
                        '"etiqueta":"'+$dimension.html()+'", '+
                        '"valor":"'+category+'"'+
                        "}";
    
    if (filtros != '' && filtros != null)
        separador1 += ', ';    
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