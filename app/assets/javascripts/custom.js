$(document).ready(function(){

  $('.best_in_place').best_in_place();

  function tree_dropdown() {
    var text = $('#order_tree_id :selected').text().split(' ');
    var tree_id = $('#order_tree_id :selected').val();
    var type = text[2].toLowerCase();
    var data = $('#available_trees').data('url');

    $.each(data, function(k,v) {
      if (v['id'] == tree_id) {
        $('#price').text('Price $' + v['price']);
      };
    });
    $('#tree-display').removeClass('balsam');
    $('#tree-display').removeClass('fraser');
    $('#tree-display').addClass(type);
    $('#tree-icon').text(' '+text[0]+'ft. '+text[2]);
  };

  $('#tree-display').removeClass('display-none');
  tree_dropdown();

  $('#order_tree_id').change(tree_dropdown);
});
