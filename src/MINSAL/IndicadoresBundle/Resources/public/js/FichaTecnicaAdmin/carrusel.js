function activarCarrusel() {
    $( ".lb_gallery").rlightbox();

    //Activar el carrusel
    var cantImg = $('.lb_gallery').length;
    if (cantImg > 5)
        cantImg = 5;
    $("#carousel").rcarousel({
        visible: cantImg,
        step: 1,
        auto: {enabled: true},
        width: 130,
        height: 110
    });
    
    $("#ui-carousel-next")
            .add("#ui-carousel-prev")
            .hover(
                    function() {
                        $(this).css("opacity", 0.7);
                    },
                    function() {
                        $(this).css("opacity", 1.0);
                    }
            );
    $("#ui-carousel-close").click(function() {
        $('#container').hide();
        $('#show-carousel').show();
    });
    $("#ui-carousel-show").click(function() {
        $('#show-carousel').hide();
        $('#container').show();

    });
}

function cargarImagenes() {
    if ($('.marco-sala').attr('id-sala')) {        
        $('#carousel').load(
                Routing.generate('sala_get_imagenes', {id: $('.marco-sala').attr('id-sala')}),
        function(response, status, xhr) {
            if ($('.lb_gallery').length > 0) {
                activarCarrusel();
                $('#container').show();
            }
        });
    }
}