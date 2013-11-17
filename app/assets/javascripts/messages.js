$(document).ready(function() {

  // This was originally an effort to expand the div to show all messages.
  // But now it's time to move on... will come back to this. 
  
  // $('#messages').hover(
  //   function() {
  //     $(this).addClass('expand');
  //   },
  //   function() {
  //     $(this).removeClass('expand');
  //   }
  // );

  $(function() {
    var faye = new Faye.Client('http://localhost:9292/faye');
    faye.subscribe("/messages/new", function(data) {
      eval(data);
    });
  });

});