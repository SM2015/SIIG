graficoLineas = function(ubicacion, datos, colorChosen, categoryChoosen) {

    this.tipo = 'lineas';
    var margin = {top: 20, right: 40, bottom: 20, left: 50},
    width = 500 - margin.left - margin.right,
            height = 300 - margin.top - margin.bottom
            ;
    var currentDatasetChart = datos;
    
    var xScale = d3.scale.linear()
            .domain([0, currentDatasetChart.length - 1])
            //.domain(d3.extent(currentDatasetChart, function(d) { return d.category; }))
            .range([0, width])
            ;    

    var yScale = d3.scale.linear()
            .domain([0, d3.max(currentDatasetChart, function(d) {
                return parseFloat(d.measure);
            })])
            .range([height, 0])
            ;
    var yAxis = d3.svg.axis()
        .scale(yScale)
        .orient("left")    
        .ticks(5);
        
    var line = d3.svg.line()            
            .x(function(d, i) {
                return xScale(i);
            })
            .y(function(d) {
                return yScale(parseFloat(d.measure));
            })
            ;

    $('#' + ubicacion).html('');
    var svg = d3.select("#"+ubicacion).append("svg")
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
        .call(yAxis);            
      
    plot.append("path")
            .attr("class", "line")            
            .attr("d", line)            
            // add color
            .attr("stroke", 'black')
            .transition().duration(1000).delay(20)
            ;

    plot.selectAll(".dot")
        .data(currentDatasetChart)
        .enter().append("circle")
        .attr("class", "dot")
        .attr("fill", function(d,i) {
            return colores_alertas(d.measure, i)
        })       
        .attr("cx", line.x())
        .attr("cy", line.y())
        .attr("r", 7.5)
        .attr("stroke", colorChosen)
        .append("title")
        .text(function(d) {
            return d.category + ": " + d.measure;
        })        
        ;        
    if (ubicacion == 'graficoPrimario')
        plot.selectAll(".dot").on("click", function(d, i) {            
            descenderNivelDimension(d.category);
        });
    // Add x labels to chart	
    var xLabels = svg
        .append("g")
        .attr("transform", "translate(" + margin.left + "," + (margin.top + height) + ")")
        ;

    xLabels.selectAll("text.xAxis")
        .data(currentDatasetChart)
        .enter()
        .append("text")
        .text(function(d) {
            return d.category;
        })
        .attr("text-anchor", "middle")
        // Set x position to the left edge of each bar plus half the bar width
        .attr("x", line.x())
        .attr("y", 17)        
        ;
            

    /*if (categoryChoosen != null)
        // Title
        svg.append("text")
                .attr("x", (width + margin.left + margin.right) / 2)
                .attr("y", 15)
                .attr("class", "title")
                .attr("text-anchor", "middle")
                .text("Datos de " + categoryChoosen)
                ;
      */ 
     this.ordenar = function(modo_orden, ordenar_por) {
    //clearTimeout(sortTimeout);
return;
    // Copy-on-write since tweens are evaluated after a delay.
    if (ordenar_por=='dimension')
        var x0 = xScale.domain(currentDatasetChart.sort(
            (modo_orden=='asc') ? function(a, b) { return d3.ascending(a.category, b.category); }:
            function(a, b) { return d3.descending(a.category, b.category); }
            )
        .map(function(d) { return d.category; }))
        .copy();
    else
        var x0 = xScale.domain(currentDatasetChart.sort(
            (modo_orden=='asc') ? function(a, b) { return d3.ascending(a.measure, b.measure); }:
            function(a, b) { return d3.descending(a.measure, b.measure); }
            )
        .map(function(d) { return d.category; }))
        .copy();
    var transition = svg.transition().duration(750),
        delay = function(d, i) { return i * 90; };

    transition.selectAll("rect")
        .delay(delay)
        .attr("x", function(d) { return x0(d.category); });

    transition.select(".x.axis")
        .call(xAxis)
      .selectAll("g")
        .delay(delay);
  }
}