$(document).ready(function(){
  $("#add_new_address").click(function(){
    $("input[name='order[address_id]']").attr('checked', false);
    $("#address_form_container").removeClass('hidden');
  })

  $("#cancel_address_form").click(function(){
    $("#address_form_container").find(':input').val("");
    $("#address_form_container").addClass('hidden');
  })
})