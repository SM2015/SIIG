$(document).ready(function(){
    //$( "#accordion" ).accordion();
    //$('#errores_individuales').popover('show')
    $('i').popover('show');
    
    $('#culture').change(function(){
       $.get(Routing.generate('change_locale', {locale: $(this).val()}));
    });
})