/*
Funcion grafico_colAgrpuadas(ubicacion,res)
ubicacio = div que contendra el grafico
res= Respuesta ajax de Pentaho CDA
Requiere la libreria d3.v3
*/
 function grafico_colAgrupadas(ubicacion, res){
var margin = {top: 20, right: 20, bottom: 30, left: 40},
    width = 400 - margin.left - margin.right,
    height = 250 - margin.top - margin.bottom;

var x = d3.scale.ordinal()
    .rangeRoundBands([0, width], .1);

var y = d3.scale.linear()
    .rangeRound([height, 0]);

var color = d3.scale.ordinal()
    .range(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"]);

var xAxis = d3.svg.axis()
    .scale(x)
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(y)
    .orient("left")
    .tickFormat(d3.format(".2s"));

var svg = d3.select(ubicacion).append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

var cols=[];
$.each(res.metadata,function(i,d){cols.push(d.colName);});
var datos=[];
$.each(res.resultset,function(i,d){datos.push(d);});

var data=datos.map(function(dat,ii){
 return JSON.parse('{'+cols.map(function(col,i){
        return '"'+col +'":"'+dat[i]+'"'; })+'}'); 
 });

 color.domain(d3.keys(data[0]).filter(function(item) { return item !== cols[0];}));
  data.forEach(function(d) {
    var y0 = 0;
    d.ages = color.domain().map(function(name) { return {name: name, y0: y0, y1: y0 += +d[name]}; });
    d.total = d.ages[d.ages.length - 1].y1;


  });
  data.sort(function(a, b) { return b.total - a.total; });

  x.domain(data.map(function(d) { return d.eje_x; }));
  y.domain([0, d3.max(data, function(d) { return d.total; })]);

//console.log('Xdomain'+x.domain());
//console.log('Ydomain'+y.domain());
 
svg.append("g")
      .attr("class", "x axis columnas")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis)
   .selectAll("text")	
            .style("text-anchor", "end")
            .attr("dx", "-.8em")
            .attr("dy", ".15em")
            .attr("transform", function(d) {
                return "rotate(-45)" 
                });	

  svg.append("g")
      .attr("class", "y axis columnas")
      .call(yAxis)
    .append("text")
      .attr("y", -10)
      .attr("x", 25)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Valores");

  var state = svg.selectAll(".eje_x")
      .data(data)
    .enter().append("g")
      .attr("class", "g")
      .attr("transform", function(d) { return "translate(" + x(d.eje_x) + ",0)"; });

  state.selectAll("rect")
      .data(function(d) { return d.ages; })
    .enter().append("rect")
      .attr("width", x.rangeBand())
      .attr("y", function(d) { return y(d.y1); })
      .attr("height", function(d) { return y(d.y0) - y(d.y1); })
      .style("fill", function(d) { return color(d.name); });

  var legend = svg.selectAll(".legend")
      .data(color.domain().slice().reverse())
    .enter().append("g")
      .attr("class", "legend")
      .attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; });

  legend.append("rect")
      .attr("x", width - 18)
      .attr("width", 18)
      .attr("height", 18)
      .style("fill", color);

  legend.append("text")
      .attr("x", width - 24)
      .attr("y", 9)
      .attr("dy", ".35em")
      .style("text-anchor", "end")
      .text(function(d) { return d; });
}

