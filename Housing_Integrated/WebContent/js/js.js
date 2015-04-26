$(document).ready(function() {
    
    $('.adv_search_btn')
    .on('click', function( e ) {
    $('div#modal').addClass('active');
    e.preventDefault();
    });

    $('#close-modal')
    .on('click', function( e ) {
    $('div#modal').removeClass('active');
    e.preventDefault();
    }); 


});

