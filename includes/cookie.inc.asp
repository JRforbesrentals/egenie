<!-- Copyright (c) OpenGlobal. GNU/GPL V3 licence. You may copy and modify this, providing the link to http://www.openglobal.co.uk remains intact. -->
<div id="openglobal_privacy_widget" class="cookie-wrapper centered">
Accept <a title="This website uses cookies to store information on your computer. Some of these cookies are used for visitor analysis, others may be necessary for the website to function properly. WE do not use any 3rd party cookies on this site. You should configure your browser to only accept the cookies you wish to approve, or leave this website." rel="privacy" href="#">Cookies</a>?

<div class="cookie-button-wrapper">
<button id="openglobal_privacy_accept" class="button-cookie" onclick="openglobal_privacy_accept();return false;">Yes</button>
<button id="openglobal_privacy_wait" class="button-cookie" onclick="clearTimeout(openglobal_privacy_timer);return false;">Wait</button>
<button id="openglobal_privacy_leave" class="button-cookie" onclick="window.location='http://epetitions.direct.gov.uk/petitions/14640';">Leave</button>

</div>
<span style="font-size: 9px">Provided by <a href="http://www.openglobal.co.uk" title="OpenGlobal e-commerce web design and promotion">OpenGlobal E-commerce</a></span>
</div>
<script type="text/javascript">
//<![CDATA[
var openglobal_privacy_timeout = 0;
var openglobal_privacy_functions = [];

var openglobal_privacy_widget = document.getElementById('openglobal_privacy_widget');
var results = document.cookie.match ( '(^|;) ?openglobal_privacy_widget=([^;]*)(;|$)' );
if (results) {
  if (1 == unescape(results[2])) {
    openglobal_privacy_accept();
  }
} else {
  window.onload = function() {
    for (var i = 0; i < document.links.length; i++) {
      var link_href = document.links[i].getAttribute('href');
      if ('privacy' != document.links[i].getAttribute('rel') && (!/^[\w]+:/.test(link_href) || (new RegExp('^[\\w]+://[\\w\\d\\-\\.]*' + window.location.host)).test(link_href))) {
        var current_onclick = document.links[i].onclick;
        document.links[i].onclick = function() {openglobal_privacy_accept();current_onclick();};
      }
    }
  };
}

var openglobal_privacy_timer;
if (openglobal_privacy_timeout > 0) {
   openglobal_privacy_timer = setTimeout('openglobal_privacy_tick()', 1000);
} else {
  var openglobal_privacy_wait = document.getElementById('openglobal_privacy_wait');
  if (null != openglobal_privacy_wait) {
    openglobal_privacy_wait.parentNode.removeChild(openglobal_privacy_wait);
  }
}
function openglobal_privacy_tick() {
  if (0 >= --openglobal_privacy_timeout) {
    openglobal_privacy_accept();
    return;
  }
  var openglobal_privacy_accept_button = document.getElementById('openglobal_privacy_accept');
  if (null != openglobal_privacy_accept_button) {
    openglobal_privacy_accept_button.innerHTML = 'Yes (' + openglobal_privacy_timeout + ')';
    openglobal_privacy_timer = setTimeout('openglobal_privacy_tick()', 1000);
  }
}

function openglobal_privacy_accept() {
  clearTimeout(openglobal_privacy_timer);
  document.cookie = 'openglobal_privacy_widget=1; path=/; expires=Mon, 18 Jan 2038 03:14:00 GMT';
  openglobal_privacy_widget.parentNode.removeChild(openglobal_privacy_widget);
  for (var i = 0; i < openglobal_privacy_functions.length; i++) {
    openglobal_privacy_functions[i]();
  }
}
//]]>
</script>