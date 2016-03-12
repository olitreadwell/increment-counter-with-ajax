$(document).ready(function(){

  // center text in middle of page
  $('main').css({ 'width':'100%', 'text-align':'center' });
  var h1 = $('h1').height();
  var h = h1/2;
  var w1 = $(window).height();
  var w = w1/2;
  var m = w - h
  $('main').css("margin-top",(m - (m*.30)) + "px")


  $('#increment').click(function(event) {
    event.preventDefault();
    console.log("prevented default action");
    $.ajax({
      type: "PUT",
      url: "/increment_counter_ajax",
      data: $('form').serialize(),
      success: function (data) {
        console.log(data);
        $("#value").html(data.counter_value);
      },
      dataType: 'json'
    });
  });

});
