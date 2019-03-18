// ouvre le sous et referme le sous menu

$(document).on('turbolinks:load', function() {
	$("#genders").mouseenter(function(){
	  $("#categories").slideDown();
	})

	$("body").click(function() {
	  $("#categories").slideUp();
	});

	$("#categories").click(function(e) {
	  e.stopPropagation();
	});
});