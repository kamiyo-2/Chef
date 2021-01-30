$('.btn-trigger').on('click', function(){
  $(this).toggleClass('active');
  if ($(this).hasClass('active')){
      $('nav').css({
          'visibility': 'visible',
          'opacity': 1
      });
  } else {
      $('nav').css({
          'visibility': 'hidden',
          'opacity': 0
      });
  }
  return false;
});