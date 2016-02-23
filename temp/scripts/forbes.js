(function() {
    var forbes = {
      init:function() {
      //  nav function

      var submenu = $('div.submenu')
        //  submenu.hide();


      
        $('#togglemenu').on('touchstart click',function(e) {
            e.preventDefault();
        var $body = $('body'),
            $page = $('.wrapper'),
            $menu = $('#menu'),
            transitionEnd = 'transitionend webkitTransitionEnd otransitionend MSTransitionEnd';

            $body.addClass('animating');
            $('.promptstrip').hide();

            if($body.hasClass('menu-visible')) {
              $body.addClass('right');
            } else {
              $body.addClass('left');
            }
            $page.on(transitionEnd,function() {
              $body
                  .removeClass('animating left right')
                  .toggleClass('menu-visible');
                $page.off(transitionEnd)
            });
        });
      },
      mobileMenu:function() {
        var menulink = $('#menu li a'), 
            dropdown = $('a.dropdown'),
            submenu = $('.submenu'),
            $window = $(window);
      //      $window.on('resize',function() {
            if($window.width() < 767) {
            submenu.addClass('closed');
            $('a.dropdown').on('click',function(e) {
               e.preventDefault();
                if($(this)
                    .parent()
                    .children(submenu)
                    .hasClass('closed')) {
                  $(this)
                    .removeClass('icon-dropdown')
                    .addClass('icon-dropdown-open')
                    .parent()
                    .children(submenu)
                    .removeClass('closed');
                } else {
                  $(this)
                    .removeClass('icon-dropdown-open')
                    .addClass('icon-dropdown')
                    .parent()
                    .children(submenu)
                    .addClass('closed');
                }
           });
        };
      },
      contentToggle:function() {
        var tb = $('.toggle-box') || $('.toggle-box-related'),
            tbSlideDown = $('.toggle-box-slidedown'),
            tbLink = $('.toggle-link*');
        tbSlideDown.slideDown(500);
      //  tbLink.addClass('icon-toggle-dropdown');
        tbLink.on('click',function(e) {
          e.preventDefault();
          if($(this).next(tb).is(':hidden')) {
            $(this)
              .removeClass('icon-toggle-dropdown')
              .addClass('icon-toggle-dropdown-open')
              .next(tb)
              .show();
          } else {
            $(this)
              .removeClass('icon-toggle-dropdown-open')
              .addClass('icon-toggle-dropdown')
              .next(tb)
              .hide();
          }
        })
      },

      hideMenu:function() {
      //  var submenu = $('div.submenu')
      //  submenu.focusout(function() {
      //    if(submenu.is(':visible')) {
      //      submenu.hide();
      //      alert('test onfocusout');
      //    };
      //  });
      },
      formMoreDetails:function() {
          var moreDetails = $('div.module-moredetails'),
              noaddress = $('.noaddress');
          noaddress.on('click',function(e) {
              e.preventDefault();
              $(this)
                .closest('.col-12')
                .next(moreDetails)
                .fadeToggle('slow')
                .addClass('backgroundAnimated')
          })

      },


      addressMoreDetails:function() {
          var moreDetailsNeeded = $('input.moreDetailsNeeded');

              moreDetailsNeeded.on('blur',function() {
               // alert('inputted blurred')
               $(this)
                .parent()
                .siblings('.module-moredetails')
                .fadeToggle()
              })

      },
      promptStrip:function() {
        var showPrompt = $('.showprompt'),
            promptStrip = $('.promptstrip'),
            closeprompt = $('.closeprompt')
            $('.headermobile').find(showPrompt).on('click',function() {
              $(promptStrip).toggle();
            });
            $('.contentwrapper').find(showPrompt).on('click',function() {
              $(this).parents('.contentwrapper').siblings(promptStrip).toggle();
            });;
            closeprompt.on('click',function() {
              promptStrip.hide();
            });
      }
    }
    forbes.init();
    forbes.mobileMenu();
    forbes.contentToggle();
    forbes.hideMenu();
    forbes.formMoreDetails();
    forbes.addressMoreDetails();
 //   forbes.toggleTerms();
    forbes.promptStrip();
  //  forbes.contentToggle();
  //  forbes.termsToggle();
  })();