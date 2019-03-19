//= require jquery3
//= require rails-ujs
//= require popper
//= require turbolinks
//= require bootstrap-sprockets
//= require cocoon
//= require highcharts
//= require chartkick
//= require_tree 


// FlashMessages
window.setTimeout(function() {
   $(".alert").fadeTo(3000, 0).slideUp(2000, function() {
       $(this).hide();
   });
}, 3000);

//DropDownMenu
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

//MenuDashboard
$(document).ready(function() {
    $('.model_link').click(function() {
        var buttonName = $(this).attr('id').split('_')[0];
        $('#button').val(buttonName);
        $('form').submit();
    });
});


//on off session
$(document).on('turbolinks:load', function() {
	$('#session').mouseenter(function(){
		$(".fa-toggle-on").css('display', 'none');
		$(".fa-toggle-off").css('display', 'inline-block');
	})
	$('#session').mouseleave(function(){
		$(".fa-toggle-on").css('display', 'inline-block');
		$(".fa-toggle-off").css('display', 'none');
	})
});


//scroll button 
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    document.getElementById("top-button").style.display = "block";
  } else {
    document.getElementById("top-button").style.display = "none";
  }
};

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0; // For Safari
  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
};



$(document).on('turbolinks:load', function() {
 $('.tag-tooltip').toolTip(); 
});