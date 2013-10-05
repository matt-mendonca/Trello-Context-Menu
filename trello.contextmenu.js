;(function($) {	
  window.trelloJS = window.trelloJS || {};

	trelloJS.contextMenu = function() {
    var listClick = function(event) {
          $(this).find('.js-open-list-menu').click();
          event.preventDefault();
        },

        cardClick = function(event) {
	        $(this).find('.card-operation').click();
	        $(this).siblings('.card-operation').click();
	        return false;
        };

    return {
      listClick: listClick,
      cardClick: cardClick
    }
	}();

  $(function() {
    $('.list').not('.add-list').on('contextmenu', trelloJS.contextMenu.listClick);
    $('.list-card-details').on('contextmenu', trelloJS.contextMenu.cardClick);
  });
})(jQuery);