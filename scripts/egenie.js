(function() {
    var egenie = {
      init:function() {
      var submenu = $('div.submenu')      
        $('#togglemenu').on('touchstart click',function(e) {
            e.preventDefault();
        var $body = $('body'),
            $page = $('.wrapper'),
            $nav = $('nav'),
            transitionEnd = 'transitionend webkitTransitionEnd otransitionend MSTransitionEnd';
            $body.addClass('animating');
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
     var    mobileToggle = $('.mobile-toggle'),
            submenu = $('[class*="submenu-"]')
        mobileToggle.on('click',function() {
          if($(this).next(submenu).is(':hidden')) {
              $(this)
                .removeClass('icon-dropdown-closed')
                .addClass('icon-dropdown-open')
                .next(submenu)
                .addClass('visible')
                .show()
              } else {
              $(this)
                .removeClass('icon-dropdown-open')
                .addClass('icon-dropdown-closed')
                .next(submenu)
                .removeClass('visible')
                .hide();
              }
           });
      },
      quickEnquiry:function() {
          var formQuickEnquiry = $('#formQuickEnquiry'),
              buttonQuickEnquiry = $('.button-quickenquiry')
              formQuickEnquiry.on('submit',function(e) {
                  e.preventDefault();
                  e.stopImmediatePropagation();
                  buttonQuickEnquiry
                    .attr('disabled','true')
                    .addClass('button-disabled');
                    
              var   QuickName = $('#QuickName').val(),
                    QuickFullName = $('#QuickFullName').val(),
                    QuickEmail = $('#QuickEmail').val(),
                    QuickTel = $('#QuickTel').val(),
                    QuickHowHelp = $('#QuickHowHelp').val(),
                    QuickDataString = '&QuickName=' + QuickName + '&QuickFullName=' + QuickFullName + '&QuickEmail=' + QuickEmail + '&QuickTel=' + QuickTel  + '&QuickHowHelp=' + QuickHowHelp                    
                    
                  $.ajax({
                     type: "POST",
                     url: "quickenquirysubmit.asp",
                     data:encodeURI(QuickDataString),
                     success: function() {
                         formQuickEnquiry.html("<div id=\"message\" class=\"centered\"></div>");
                         $('#message').html("<h5><span class=\"egenie\"><em>e</em>genie</span> have received your details!</h5>")
                         .append("<p>We will be in touch soon.</p>")
                         .hide()
                         .fadeIn(1500);
                     } 
                  });
              });
      },
      toggleBoxes:function() {
            var toggler = $('[class*="toggler-"]'),
                toggleBoxLink = $('[class*="toggle-link-"]'),
                toggleBox = $('[class*="toggle-box-"]'),
                toggleBoxFaqs = $('.toggle-box-faqs'),
                toggleIcon = toggleBoxLink.children('span')
                toggleBoxFaqs
                  .first()
                  .slideDown()
                  .prev(toggleBoxLink)
                  .children(toggleIcon)
                  .removeClass('icon-toggle-close')
                  .addClass('icon-toggle-open')

                 toggleBoxLink.on('click',function() {
                    if($(this).next(toggleBox).is(':hidden')) {
                    $(this)
                      .next(toggleBox)
                      .slideDown()
                      .prev(toggleBoxLink)
                      .children(toggleIcon)
                      .removeClass('icon-toggle')
                      .addClass('icon-toggle-open')
                      .end()
                      .parent(toggler)
                      .siblings()
                      .find(toggleIcon)
                      .removeClass('icon-toggle-open')
                      .addClass('icon-toggle') 
                      .parent()                
                      .next(toggleBox)
                      .slideUp()
                  } else {
                    $(this)
                      .next(toggleBox)
                      .slideUp()
                      .prev(toggleBoxLink)
                      .children(toggleIcon)
                      .removeClass('icon-toggle-open')
                      .addClass('icon-toggle')
                      .end()
                      .parent(toggler)
                      .siblings()
                      .find(toggleIcon)
                      .removeClass('icon-toggle-open')
                      .addClass('icon-toggle') 
                  }
                });
      },
      toolTips:function() {

            var ttHelp = $('.tooltip-help'),
                ttBubble = $('.tooltip-bubble')
                $('<span></span>', {
                    'text' : 'X',
                    'class' : 'tooltipClose'
                })
                .appendTo(ttBubble)
                ttHelp.on('click',function(e) {
                  ttBubble.hide();
                  $(this).next(ttBubble).toggle();
                  e.stopPropagation();
                });
                $('.tooltipClose').on('click',function() {
                  $(this).parent().hide();
                });
                $('body').on('click',function() {
                  ttBubble.hide();
                })
     
      }
    }
    egenie.init();
    egenie.mobileMenu();
    egenie.quickEnquiry();
    egenie.toggleBoxes();
    egenie.toolTips();
  })();