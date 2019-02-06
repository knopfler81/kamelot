//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require cocoon
//= require bootstrap-datepicker
//= require highcharts
//= require chartkick
//= require_tree .


window.setTimeout(function() {
   $(".alert").fadeTo(1000, 0).slideUp(2000, function() {
       $(this).hide();
   });
}, 3000);


$(document).ready(function(){
  $('.datepicker').datepicker({dateFormat: "dd/mm/yyyy", language: "fr"});
});