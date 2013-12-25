/*
Funcion grafico_multiLineas(ubicacion,res)
ubicacion = div que contendra el grafico
res= Respuesta ajax de Pentaho CDA con campo fecha
Requiere la libreria d3.v3
*/

grafico_multiLineas=function(ubicacion, res){

var margin = {top: 20, right: 20, bottom: 40, left: 40},
    width = 400 - margin.left - margin.right,
    height = 250 - margin.top - margin.bottom;

var parsefecha = d3.time.format("%Y%m%d").parse;

var x = d3.time.scale()
    .range([0, width]);

var y = d3.scale.linear()
    .range([height, 0]);

var color = d3.scale.category10();

var xAxis = d3.svg.axis()
    .scale(x)
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(y)
    .orient("left");

var line = d3.svg.line()
    .interpolate("basis")
    .x(function(d) { return x(d.fecha); })
    .y(function(d) { return y(d.temperature); });

var svg = d3.select("body").append("svg")
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


console.log(JSON.stringify(data[0]));  
  color.domain(d3.keys(data[0]).filter(function(key) { return key !== "fecha"; }));

  data.forEach(function(d) {
    d.fecha = parsefecha(d.fecha);
  });

  var valores = color.domain().map(function(name) {
    return {
      name: name,
      values: data.map(function(d) {
        return {fecha: d.fecha, temperature: +d[name]};
      })
    };
  });

  x.domain(d3.extent(data, function(d) { return d.fecha; }));

  y.domain([
    d3.min(valores, function(c) { return d3.min(c.values, function(v) { return v.temperature; }); }),
    d3.max(valores, function(c) { return d3.max(c.values, function(v) { return v.temperature; }); })
  ]);

  svg.append("g")
      .attr("class", "x axis")
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
      .attr("class", "y axis")
      .call(yAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Valores)");

  var city = svg.selectAll(".city")
      .data(valores)
    .enter().append("g")
      .attr("class", "city");

  city.append("path")
      .attr("class", "line")
      .attr("d", function(d) { return line(d.values); })
      .style("stroke", function(d) { return color(d.name); });

  city.append("text")
      .datum(function(d) { return {name: d.name, value: d.values[d.values.length - 1]}; })
      .attr("transform", function(d) { return "translate(" + x(d.value.fecha) + "," + y(d.value.temperature) + ")"; })
      .attr("x", -50)
      .attr("dy", ".35em")
      .text(function(d) { return d.name; });

}

