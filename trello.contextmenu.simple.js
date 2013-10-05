;(function($) { 
  $(function() {
    $('.list').not('.add-list').on('contextmenu', function(event) {
      $(this).find('.js-open-list-menu').click();
      event.preventDefault();
    });

    $('.list-card-details').on('contextmenu', function(event) {
      $(this).find('.card-operation').click();
      $(this).siblings('.card-operation').click();
      return false;
    });
  });
})(jQuery);