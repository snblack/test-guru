document.addEventListener('turbolinks:load', function() {
  var url = document.URL;

  if (url.includes('result')) {
    history.pushState(null, null, location.href);
    window.onpopstate = function(event) {
      history.go(1);
    };
  };
})
