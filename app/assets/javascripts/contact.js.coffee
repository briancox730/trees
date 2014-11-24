$(document).ready ->
  $('#contact').click(this.modal());
  $("#contact").on("ajax:success", (e, data, status, xhr) ->
      $('#contact').modal('hide')
      $('#notice-box').append("<div class='alert alert-success'>Message Sent!</div>")
    ).on "ajax:error", (e, data, status, xhr) ->
      errors = data.responseJSON.errors
      $.each errors, (key, value) ->
        $('#modal-body').append("<span class='red'>*" + value + "</span><br>")
