$(document).ready(function(){
  $('.btn').button();

  $('.btn').click(function() {
    $(this).button('toggle');
  });
});
