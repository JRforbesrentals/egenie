/*
(function() {
   var ie = {
		menu:function() {
			$('a#togglemenu').on('click',function() {
				$(this).parents().toggleClass('iemenu');
				$('body').addClass('mos');
			});
		}
	}	
	ie.menu();	
})();
*/




	(function() {
        $('#togglemenu').on('click',function(e) {
            e.preventDefault();

             
              $('.wrapper').toggleClass('wrapperright')
              $('nav').toggleClass('navright')



        });



















      })();
