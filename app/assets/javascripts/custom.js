$(document).ready(function(){

  $('.best_in_place').best_in_place();

  function tree_dropdown() {
    var text = $('#order_tree_id :selected').text().split(' ');
    var tree_id = $('#order_tree_id :selected').val();
    var type = text[2].toLowerCase();
    var trees = $('#available_trees').data('trees');
    var accessories = $('#accessories').data('accessories');
    var checked_accessories = $('input.accessories:checked');
    var total = 0;

    debugger;

    $.each(trees, function(k,v) {
      if (v['id'] == tree_id) {
        total = total + v['price']
      };
    });

    $.each(checked_accessories, function(k,v) {
      $.each(accessories, function(l, p) {
        if (v.value == p['id']) {
          total = total + p['price'];
        };
      });
    });

    $('#tree-display').removeClass('balsam');
    $('#tree-display').removeClass('fraser');
    $('#tree-display').addClass(type);
    $('#tree-icon').text(' '+text[0]+'ft. '+text[2]);
    $('#price').text('$' + total.toFixed(2))
  };

  $('#tree-display').removeClass('display-none');
  tree_dropdown();

  $('#order_tree_id').change(tree_dropdown);
  $('input.accessories').change(tree_dropdown);
});
