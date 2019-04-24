//= require jquery3
//= require jquery
//= require rails-ujs
//= require popper
//= require bootstrap-sprockets
//= require turbolinks
//= require summernote/summernote-bs4.min
//= require cocoon
//= require highcharts
//= require chartkick
//= require cookies_eu
//= require_tree 


// FlashMessages
window.setTimeout(function() {
   $(".alert").fadeTo(3000, 0).slideUp(2000, function() {
       $(this).hide();
   });
}, 3000);

//MenuDashboard
$(document).ready(function() {
  $('.model_link').click(function() {
      var buttonName = $(this).attr('id').split('_')[0];
      $('#button').val(buttonName);
      $('form').submit();
  });
});