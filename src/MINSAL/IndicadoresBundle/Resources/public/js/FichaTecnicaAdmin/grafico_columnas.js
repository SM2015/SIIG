graficoColumnas = function(ubicacion, datos, colorChosen, categoryChoosen) {

    this.tipo = 'columnas';
    var margin = {top: 0, right: 5, bottom: 25, left: 40},
    width = 390 - margin.left - margin.right,
            height = 250 - margin.top - margin.bottom,
            barPadding = 1
            ;

    var currentDatasetChart = datos;
    var zona = ubicacion;
    var xScale = d3.scale.ordinal()
            .domain(currentDatasetChart.map(function(d) {
        return d.category;
    }))
            .rangeRoundBands([0, width], .1)
            ;

    var max_y;

    //El nivel máximo de la escala puede ser el mayor valor de la serie
    // o el mayor valor del rango, el usuario elige
    // se utiliza datasetPrincipal_bk por si se han aplicado filtros
    // Así no usará el máximo valor del filtro
    var datasetPrincipal_bk = JSON.parse($('#' + zona).attr('datasetPrincipal_bk'));
    max_y = d3.max(datasetPrincipal_bk, function(d) {
        return parseFloat(d.measure);
    });
    if ($('#' + ubicacion + ' .max_y') != null && $('#' + ubicacion + ' .max_y').val() == 'rango_alertas')
        max_y = $('#' + zona + ' .titulo_indicador').attr('data-max_rango');

    var yScale = d3.scale.linear()
            .domain([0, max_y])
            .range([height, 0])
            ;

    var yAxis = d3.svg.axis().scale(yScale).orient("left").ticks(5);
    var xAxis = d3.svg.axis().scale(xScale).orient("bottom");
    
    // Dibuja el gráfico
    this.dibujar = function() {
        $('#' + ubicacion + ' .grafico').html('');
            var svg = d3.select("#" + ubicacion + ' .grafico')
                .append("svg")
                .attr("width", '95%')
                .attr("viewBox", '-5 0 450 260')
                .attr("preserveAspectRatio", 'none')
                .attr("id", "ChartPlot")
                ;

        var plot = svg
                .append("g")
                .attr("transform", "translate(" + margin.left + "," + margin.top + 5 + ")")
                ;
        var long = $('#' + ubicacion + ' .titulo_indicador').attr('data-unidad-medida').length;

        svg.append("g")
                .attr("class", "axis")
                .attr("transform", "translate(" + margin.left + ",5)")
                .call(yAxis)
                .append("text")
                .attr("transform", "rotate(-90)")
                .attr("y", -30)                
                .attr("x", -((height / 2) + (long / 2) * 6.5))
                .text($('#' + ubicacion + ' .titulo_indicador').attr('data-unidad-medida'));

        svg.append("g")
                .attr("class", "x axis")
                .attr("transform", "translate(" + margin.left + "," + (margin.top + height + 5) + ")")
                .call(xAxis);

        plot.selectAll("rect")
                .data(currentDatasetChart)
                .enter()
                .append("rect")
                .attr("stroke", 'black')
                .attr("stroke-width", '2px')
                .attr("x", function(d, i) {
            return xScale(d.category);
        })
                .transition().duration(1000).delay(20)
                .attr("width", xScale.rangeBand())
                .attr("y", function(d) {
            return yScale(parseFloat(d.measure));
        })
                .attr("height", function(d) {
            return height - yScale(parseFloat(d.measure));
        });
        plot.selectAll("rect").append("title")
                .text(function(d) {
            return d.category + ": " + d.measure;
        });

        plot.selectAll("rect").on("click", function(d, i) {
            descenderNivelDimension(ubicacion, d.category);
        });
        if (colorChosen == null)
            plot.selectAll("rect").attr("fill", function(d, i) {
                //evaluar que color le corresponde
                return colores_alertas(ubicacion, d.measure, i)
            });
        else
            plot.selectAll("rect").attr("fill", colorChosen);
    };
    this.ordenar = function(modo_orden, ordenar_por) {
        
        var svg = d3.select("#" + zona + ' .grafico');
        
        var datos_ordenados = ordenarArreglo(currentDatasetChart, ordenar_por, modo_orden);
        var x0 = xScale.domain(datos_ordenados.map(function(d) {
                return d.category;
            })).copy();

        var transition = svg.transition().duration(750),
                delay = function(d, i) {
            return i * 40;
        };
        
        transition.selectAll("#"+ubicacion+" rect")
                .delay(delay)
                .attr("x", function(d) {
            return x0(d.category);
        });
        transition.select('#'+ubicacion+' .x.axis')
                .call(xAxis)
                .selectAll("g")
                .delay(delay);
        // Ordenar la tabla de datos
        $('#' + zona).attr('datasetPrincipal', JSON.stringify(currentDatasetChart));
    };
}