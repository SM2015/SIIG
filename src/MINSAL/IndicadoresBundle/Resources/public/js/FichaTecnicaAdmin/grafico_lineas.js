graficoLineas = function(ubicacion, datos, colorChosen, categoryChoosen) {

    this.tipo = 'lineas';
    var margin = {top: 20, right: 40, bottom: 20, left: 60},
    width = 500 - margin.left - margin.right,
            height = 300 - margin.top - margin.bottom
            ;
    var currentDatasetChart = datos;

    var xScale = d3.scale.ordinal()
        .domain(currentDatasetChart.map(function(d) { return d.category; }))
        .rangeRoundBands([0, width], .9);
    ;
    var max_y;
    max_y = d3.max(currentDatasetChart, function(d) { return parseFloat(d.measure); });
    if ($('#max_y') != null && $('#max_y').val()=='rango_alertas')
        max_y = $('#titulo_indicador').attr('data-max_rango');
    
    var yScale = d3.scale.linear()
            .domain([0, max_y])
            .range([height, 0]);
    
    var yAxis = d3.svg.axis().scale(yScale).orient("left").ticks(5);
    var xAxis = d3.svg.axis().scale(xScale).orient("bottom");

    var line = d3.svg.line()
            .x(function(d, i) {
                return xScale(d.category);
            })
            .y(function(d) {
                return yScale(parseFloat(d.measure));
            });

    $('#' + ubicacion).html('');
    var svg = d3.select("#" + ubicacion).append("svg")
            .datum(currentDatasetChart)
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
    // create group and move it so that margins are respected (space for axis and title)

    var plot = svg
            .append("g")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
            ;

    svg.append("g")
            .attr("class", "axis")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
            .call(yAxis).append("text")            
            .attr("y", 6)        
            .attr("x", -40)
            .text($('#titulo_indicador').attr('data-unidad-medida'));

            
    svg.append("g")
      .transition().duration(1000).delay(20)
        .attr("class", "x axis")      
      .attr("transform", "translate(" + margin.left + "," + (margin.top + height) + ")")
      .call(xAxis);
      
    plot.append("path")
            .attr("class", "line")
            .attr("d", line)
            .attr("stroke", 'blue')
            ;

    plot.selectAll(".dot")
            .data(currentDatasetChart)
            .enter().append("circle")
            .attr("class", "dot")
            .transition().duration(1000).delay(20)
            .attr("fill", function(d, i) {
        return colores_alertas(d.measure, i)
    })
            .attr("cx", line.x())
            .attr("cy", line.y())
            .attr("r", 7.5)
            .attr("stroke", colorChosen);
    plot.selectAll(".dot")
            .append("title")
            .text(function(d) {
        return d.category + ": " + d.measure;
    })
            ;

    plot.selectAll(".dot").on("click", function(d, i) {
        descenderNivelDimension(d.category);
    })

    
    this.ordenar = function(modo_orden, ordenar_por) {
        
        // Copy-on-write since tweens are evaluated after a delay.
        if (ordenar_por == 'dimension')
            var x0 = xScale.domain(currentDatasetChart.sort(
                    (modo_orden == 'asc') ? 
                        function(a, b) { return d3.ascending((isNaN(a.category))?a.category:parseFloat(a.category), (isNaN(b.category))?b.category:parseFloat(b.category)); }:
                        function(a, b) { return d3.descending((isNaN(a.category))?a.category:parseFloat(a.category), (isNaN(b.category))?b.category:parseFloat(b.category)); }
            ).map(function(d) { return d.category; })).copy();
        else
            var x0 = xScale.domain(currentDatasetChart.sort(
                    (modo_orden == 'asc') ? 
                        function(a, b) {return d3.ascending(a.measure, b.measure);} :
                        function(a, b) {return d3.descending(a.measure, b.measure);}
            ).map(function(d) { return d.category; })).copy();
    
        var transition = svg.transition().duration(750),
            delay = function(d, i) {return i * 90;};

        transition.selectAll(".line").delay(delay).attr("d", line).attr("stroke", 'blue');        
        transition.selectAll(".dot").delay(delay).attr("cx", function(d) { return x0(d.category); });
        transition.select(".x.axis").call(xAxis).selectAll("g").delay(delay);  
    
    }
}