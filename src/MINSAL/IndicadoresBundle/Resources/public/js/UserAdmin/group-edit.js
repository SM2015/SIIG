$(document).ready(function() {
    $('ul[id$="_roles"] span').each(function(i, nodo){
        
        $(this).html($(this).html().replace('ROLE_SONATA_ADMIN_',''));
        $(this).html($(this).html().replace('ROLE_SONATA_USER_ADMIN_',''));        
    });
});
