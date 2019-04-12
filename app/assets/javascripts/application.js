//= require jquery3
//= require rails-ujs
//= require popper
//= require turbolinks
//= require bootstrap-sprockets
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

// $(document).on('turbolinks:load', function() {

//   // $(function() {
//     $('.return_check').on("change",function() { 
//      if( this.checked == true){
//        $(this).closest('tr').find('.select-qty').show();
//      }
//      else if(this.checked == false){
//         $(this).closest('tr').find('.select-qty').hide();
//      } 

//     // }).change(); 
//   });

// }); 