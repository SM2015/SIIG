graficoColumnas = function (ubicacion, datos, colorChosen, categoryChoosen) {

    this.tipo = 'columnas';
    var margin = {top: 0, right: 5, bottom: 20, left: 50},
    width = 500 - margin.left - margin.right,
            height = 300 - margin.top - margin.bottom,
            barPadding = 1
            ;

    var currentDatasetChart = datos;    
    var xScale = d3.scale.ordinal()
            //.domain([0, currentDatasetBarChart.length])
            .domain(currentDatasetChart.map(function(d) { return d.category; }))
            //.range([0, width])
            .rangeRoundBands([0, width], .1);
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
    var xAxis = d3.svg.axis()
        .scale(xScale)
        .orient("bottom");

    $('#' + ubicacion).html('');
    var svg = d3.select("#" + ubicacion)
            .append("svg")
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
            ;

    var plot = svg
            .append("g")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
            ;
    svg.append("g")
        .attr("class", "axis")
        .attr("transform", "translate(" + margin.left + ",0)")
        .call(yAxis);

    svg.append("g")
      .attr("class", "x axis")
      //.attr("transform", "translate(0," + height + ")")
      .attr("transform", "translate(" + margin.left + "," + (margin.top + height) + ")")
      .call(xAxis);
    
    plot.selectAll("rect")
        .data(currentDatasetChart)        
        .enter()
        .append("rect")
        .transition().duration(1000).delay(20)
        .attr("x", function(d, i) {
            return xScale(i);
        })
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
        
    if (ubicacion == 'graficoPrimario')
        plot.selectAll("rect").on("click", function(d, i) {
            descenderNivelDimension(d.category);
        });    
    if (colorChosen == null)
        plot.selectAll("rect").attr("fill", function(d, i) {            
            //evaluar que color le corresponde
            return colores_alertas(d.measure, i) 
        }); 
    else
        plot.selectAll("rect").attr("fill", colorChosen);


    /*/ Add y labels to plot	
    plot.selectAll("text")
        .data(currentDatasetChart)
        .enter()
        .append("text")
        .text(function(d) {
            return (d.measure);
        })
        .attr("text-anchor", "middle")
        .attr("text-color", "black")
        // Set x position to the left edge of each bar plus half the bar width
        .attr("x", function(d, i) {
            return (i * (width / currentDatasetChart.length)) + ((width / currentDatasetChart.length - barPadding) / 2);
        })
        .attr("y", function(d) {
            return yScale(parseFloat(d.measure)) + 10;
        })
        .attr("class", "yAxis")
        ;    
    */
    // Add x labels to chart	
    /*var xLabels = svg
        .append("g")
        .attr("transform", "translate(" + margin.left + "," + (margin.top + height) + ")")
        ;
*/
    /*xLabels.selectAll("text.xAxis")
        .data(currentDatasetBarChart)
        .enter()
        .append("text")
        .text(function(d) {
            return d.category;
        })
        .attr("text-anchor", "middle")
        .attr("x", function(d, i) {
            return (i * (width / currentDatasetBarChart.length)) + ((width / currentDatasetBarChart.length - barPadding) / 2);
        })
        .attr("y", 15)
        .attr("class", "xAxis")
        ;
*/
   /* if (categoryChoosen != null)
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
            (modo_orden=='asc') ? function(a, b) { return d3.ascending(parseFloat(a.measure), parseFloat(b.measure)); }:
            function(a, b) { return d3.descending(parseFloat(a.measure), parseFloat(b.measure)); }
            )
        .map(function(d) { return d.category; }))
        .copy();
    var transition = svg.transition().duration(750),
        delay = function(d, i) { return i * 70; };

    transition.selectAll("rect")
        .delay(delay)
        .attr("x", function(d) { return x0(d.category); });

    transition.select(".x.axis")
        .call(xAxis)
      .selectAll("g")
        .delay(delay);
  }  
}
