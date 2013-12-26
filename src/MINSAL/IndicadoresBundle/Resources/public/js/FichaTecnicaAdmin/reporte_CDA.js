$(document).ready(function() {
    jQuery(document).ajaxStart(function() {
        $('#div_carga').show();
    }).ajaxStop(function() {
        $('#div_carga').hide();});
 });    

$(document).ready(function() {
crearReporte();
});       

/*Asumimos que en el listado de busquedas existe:
dataAccessId=anios-> cantidad de anios disponibles
dataAccessId=resumen ->Resumen estadistico de los datos 
Las demas busquedas(QN)seran distribuidos dependiendo en tipo
de grafico especificado en el nombre de la busqueda: el valor despues de '|'  
*/
function crearReporte(){

var queries=[] 
 listarBusquedas().done(function(data) {
    $.each(data.resultset, function(key,nombre){
    if($.inArray(nombre[0],['anios','resumen'])<0){
        queries.push({id:nombre[0],
	titulo: nombre[1].split('|')[0],
        tipo: nombre[1].split('|')[1],});
        } } )
	 crearGraficos(queries);
        });      
}     

function listarBusquedas(){
 myurl='/reportes/listQueries?path=siig/indicador'+$('input#id').val()+'.cda';
        return $.get(myurl);                     
}

function crearGraficos(queries) {
	//ejecutar primera busqueda/listar anios disponibles
 myurl='/reportes/doQuery?path=siig/indicador'+$('input#id').val()+'.cda&dataAccessId=anios&outputType=json';
        $.getJSON(myurl,  function(resp) { 
			$.each(resp.resultset, function(key,anio){
			//Generar Reporte para cada Anio, usando el arreglo de busquedas.
			var datos = doAnio(anio,queries);	
		
		//Agegar graficos/contenido al reporte
			$('#datos').append(datos);	
			});
 })};
                
function doAnio(anio,queries){
	var contenido= doEncabezado(anio);
	var iid=$('input#id').val();
	contenido= contenido +'<table><tr>';
        $.each(queries,(function(key,query){
		contenido = contenido +'<td><div id=g'+query.id+anio+
				' class=grafico><b>'+query.titulo+'</b></div></td>';
		//crear nueva fila
		if ((key>0)&&((key-1) % 2 === 0)){
		contenido=contenido + '</tr><tr>';	}
if ($.trim(query.tipo)=='tabla'){
                 //pedir datos en forma de tabla
                 getDatos(iid,anio,query.id,'html').done(function(data){
                 $('#g'+query.id+anio).append(data);});}

         if ($.trim(query.tipo)=='barras'){
                 // pedir datos en JSON, Crear Grafico
                 getDatos(iid,anio,query.id,'json').done(function(data){
                grafico_colAgrupadas('#g'+query.id+anio,data);  });
                }
        if ($.trim(query.tipo)=='lineas'){
                // pedir datos en JSON, Crear Grafico
         getDatos(iid,anio,query.id,'json').done(function(data){
                        grafico_multiLineas('#g'+query.id+anio,data);  });
           }
       }));

     	contenido= contenido +'</tr></table>';	

	return contenido + '<br/><hr><br/>';
}

function doEncabezado(anio){
 var datos='<table ><tr><td colspan=3><h2>'+$('#nom_indicador').html()+ ' : ' + anio + 
	 	'</h2></td></tr><tr><td><b>Interpretacion: </b>'+ $('#int_indicador').html()+ 
		'<br/><br/><b>Tema: </b>'+$('#tem_indicador').html()+'</td><td><b>Variables</b><br/>'+ 
		$('#var_indicador').html()+ '</td><td><div id=res'+anio+'><b>Resumen </b> </div></td></tr></table>';
 doResumen(anio).done(function(data) {
    $('#res'+anio).append(data);});

return datos;
}

function doResumen(anio){
//Ejecutar consulta #2 que devuelve resumen estadistico
 myurl='/reportes/doQuery?path=siig/indicador'+$('input#id').val()+
	'.cda&dataAccessId=resumen&paramanio='+anio+'&outputType=html';
        return $.get(myurl);
}

function getDatos(iid,anio,qid,tipo){
   myurl='/reportes/doQuery?path=siig/indicador'+iid+
        '.cda&dataAccessId='+qid+'&paramanio='+anio+'&outputType='+tipo;
       return $.get(myurl);
};


