$(document).on('turbolinks:load', function() {


 if (window.location.pathname != "/"){

		window.onscroll = function() {scrollFunction()};

		function scrollFunction() {
		  if (document.body.scrollTop > 500 || document.documentElement.scrollTop > 500) {
		    document.getElementById("top-button").style.display = "block";
		  } else {
		    document.getElementById("top-button").style.display = "none";
		  }
		};

		$("#top-button").on('click', function(){
		 window.scroll({top: 0, left: 0, behavior: 'smooth' });
		 });

	}
});

