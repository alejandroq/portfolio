/*************************************************************************************************************/
/* Click Events                                                                                              */
/*************************************************************************************************************/
  
  $('.portfolio').on('click', function() {
    $('header .about').css({textDecoration:'none', backgroundColor:'rgba(247, 211, 88, 0)'});
    $('header .portfolio').css({textDecoration:'underline', backgroundColor:'#ECF6CE'});
    $('#about').hide(200);
    $('#portfolio').show(200); 
    $('#casestudy').fadeOut(200);
  });

  $('.about').on('click', function() {
    $('header .about').css({textDecoration:'underline', backgroundColor:'#ECF6CE'}); 
    $('header .portfolio').css({textDecoration:'none', backgroundColor:'rgba(247, 211, 88, 0)'});
    $('#about').show(200);
    $('#portfolio').hide(200);
    $('#casestudy').fadeOut(200);
  });
