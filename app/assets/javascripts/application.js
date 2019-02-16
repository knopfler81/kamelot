//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require cocoon
//= require highcharts
//= require chartkick
//= require_tree .


window.setTimeout(function() {
   $(".alert").fadeTo(1000, 0).slideUp(2000, function() {
       $(this).hide();
   });
}, 3000);

$(document).ready(function(){ 
	$('.navbar .navbar-nav > li.dropdown').hover(function(){
	 $('.dropdown-menu', this).stop(true, true).slideDown(); 
	 $(this).addClass('show');
	 }, 
	function(){ 
		$('.dropdown-menu', this).stop(true, true).slideUp(); 
		$(this).removeClass('show');
	});
});

$(document).ready(function() {
    $('.model_link').click(function() {
        var buttonName = $(this).attr('id').split('_')[0];
        $('#button').val(buttonName);
        $('form').submit();
    });
});