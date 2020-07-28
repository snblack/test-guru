document.addEventListener('turbolinks:load', function() {
  // Set the date we're counting down to
  var timer = document.querySelector('div.timer_class').dataset.timer
  // var timer_int = Number(timer)
  if (timer) {
    var countDownDate = new Date().getTime() + (1000 * timer) ;

    // Update the count down every 1 second
    var x = setInterval(function() {

      // Get today's date and time
      var now = new Date().getTime();

      // Find the distance between now and the count down date
      var distance = countDownDate - now;

      // Time calculations for days, hours, minutes and seconds
      var days = Math.floor(distance / (1000 * 60 * 60 * 24));
      var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      var seconds = Math.floor((distance % (1000 * 60)) / 1000);

      // Display the result in the element with id="demo"
      document.getElementById("demo").innerHTML = days + "d " + hours + "h "
      + minutes + "m " + seconds + "s ";

      // If the count down is finished, write some text
      if (distance < 1) {
        clearInterval(x);
        window.location = window.location.href + '/result';
      }
    }, 1000);
  }
})
