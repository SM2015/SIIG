$(document).ready(function () {
    $('#establecimiento').click(function (){
        $("#jqxgrid").jqxGrid('clear');
        $('#mensaje').html('');
        $.get( Routing.generate('get_dependencias', {codigo_establecimiento: $(this).val()}), function( data ) {
            $( "#dependencia" ).html( data );
        }); 
    });
    
    $('#dependencia').click(function (){
        $("#jqxgrid").jqxGrid('clear');
        $('#mensaje').html('');        
    });
});