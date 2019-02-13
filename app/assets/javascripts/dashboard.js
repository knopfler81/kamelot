$(document).ready(function() {
  $('.model_link').click(function() {
    var buttonName = $(this).attr('id').split('_')[0];
    $('#button').val(buttonName);
    $('form').submit();
  });
});
