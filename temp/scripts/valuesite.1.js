(function() {
    var valuesite = {
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
        var mobileToggle = $('.mobile-toggle'),
            submenu = $('[class*="submenu-"]');
            mobileToggle.addClass('closed')
            
        mobileToggle.on('click',function(){
           if($(this).next(submenu).is(':hidden')) {
              $(this)
                .removeClass('closed')
                .addClass('open')
                .next(submenu)
                .addClass('visible')
                .show()
           } else
              $(this)
                .removeClass('open')
                .addClass('closed')
                .next(submenu)
                .removeClass('visible')
                .hide();
        });
      },
lightBox:function() {
          $('<div>', {
            class : 'veil'
          })
          .insertBefore('nav');
          var lightBoxModal = $('div.lightBoxModal'),
              veil = $('div.veil')
              lightBoxModal.hide();
          lightBoxModal.css({
              'left'  : '50%',
              'margin-left' : -$('div.lightBoxModal').outerWidth() / 2
          })
          veil.addClass('hideElement')
          $('a.requestcallback').on('click',function(){
               if(veil.hasClass('hideElement')) {
                  veil.removeClass('hideElement')
                  lightBoxModal
                    .show()
                    .animate({
                      'top' : '50%', 
                      'margin-top' : -$('div.lightBoxModal').outerHeight() / 2
                  })
                  veil.on('click',function() {
                      $(this).addClass('hideElement')
                      lightBoxModal.animate({
                        'margin-top' : '-2000px'
                      })
                  })
               } else {
                  veil.addClass('hideElement')
                  lightBoxModal.hide();
               }
          });
          $('span.close').on('click',function() {
            $(this).parent().animate({
              'margin-top' : '-2000px'
            })
            veil.addClass('hideElement')
          })

        $('#formCallBack').on('submit',function() {
          var Name =  $("#Name").val(),
            Email = $("#Email").val(),    
            Tel = $("#Tel").val(),
            CallTime =  $("#CallTime").val(),
            HowHelp = $("#HowHelp").val()
          var dataString = 'Name='+ Name + '&Email=' + Email + '&Tel=' + Tel + '&CallTime=' + CallTime + '&HowHelp=' + HowHelp
          $.ajax({
            type: "POST",
            url: "callbacksubmit.asp",
            data:encodeURI(dataString),  
            success: function() {
              $('#formCallBack').html("<div id='message'></div>");
              $('#message').html("<h5>eGenie have received your details!</h5>")
              .append("<p>We will be in touch soon.</p>")
              .hide()
              .fadeIn(1500, function() {
                $('#message').append("<img id='checkmark' src='images/egenie.png' />");
              });
            }
          });
          return false;
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
      },
        productSearch:function() {
          var label = $('label.searchlabel'),
              search = $('search'),
              ulAuto = $('.ui-autocomplete')
              li = ulAuto.children('li'),
              liHeight = li.outerHeight(),
              count = 0;

          label.on('click',function() {
              if($(this).is(':visible')) {
                $(this)
                  .hide()
                  .next(search)
                  .focus();
                }
            })
            search.on('blur',function() {
              $(this)
                .val('')
                .prev(label)
                .show()
            })

            $("#project").autocomplete({
                minLength: 0,
                source: projects,
                focus: function( event, ui ) {
                  return false;
                },
              })
              .autocomplete("instance")._renderItem = function( ul, item ) {
                return $( "<li class='clearfix'>" )
                  .append( "<a href=" + item.url + ">" + "<img src=images/"+item.icon+"><span>" + item.desc + "</span></a>" )
                  .appendTo(ul);
            };
          }
        }
    valuesite.init();
    valuesite.mobileMenu();
    valuesite.toggleBoxes();
    valuesite.toolTips();
    valuesite.lightBox();
    valuesite.productSearch();
  })();