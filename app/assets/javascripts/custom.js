$(document).ready(function(){
  var text = $('#order_tree_id :selected').text().split(' ');
  var type = text[2].toLowerCase();
  $('#tree-display').addClass(type);
  $('#tree-icon').text(' '+text[0]+'ft. '+text[2]);

  $('#order_tree_id').change(function() {
    var text = $('#order_tree_id :selected').text().split(' ');
    var type = text[2].toLowerCase();
    $('#tree-display').removeClass('balsam');
    $('#tree-display').removeClass('fraser');
    $('#tree-display').addClass(type);
    $('#tree-icon').text(' '+text[0]+'ft. '+text[2]);
  })
});
