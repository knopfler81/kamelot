//On calcule le CA en JS ⚠️
$(document).on('turbolinks:load', function() {
	$(function(){
		var total = 0
		$('.starting_stock').each(function(){
			total =  total + parseFloat($(this).html());
		});
		$('.total_starting_stock').html(total);
	});

	$(function(){
		var total = 0
		$('.starting_stock_value').each(function(){
			total =  total + parseFloat($(this).html());
		});
		$('.total_starting_stock_value').html(total.toFixed(2).replace(".", ",") + " €");
	}); 


	$(function(){
		var total = 0
		$('.number_of_orders').each(function(){
			total =  total + parseFloat($(this).html());
		});
		$('.total_number_of_orders').html(total);
	});


	$(function(){
		var total = 0
		$('.number_of_sales').each(function(){
			total =  total + parseFloat($(this).html());
		});
		$('.total_number_of_sales').html(total);
	});

	$(function(){
		var total = 0
		$('.turnover_orders').each(function(){
			total =  total + parseFloat($(this).html());
		});
		$('.turnover_total_orders').html(total.toFixed(2).replace(".", ",") + " €");
	});

	$(function(){
		var total = 0
		$('.remaining_stock').each(function(){
			total =  total + parseFloat($(this).html());
		});
		$('.total_remaining_stock').html(total);
	});

	$(function(){
		var total = 0
		$('.remaining_stock_value').each(function(){
			total =  total + parseFloat($(this).html());
		});
		$('.total_remaining_stock_value').html(total.toFixed(2).replace(".", ",") + " €");
	});

	$(function(){
		var total = 0
		$('.turnover_sales').each(function(){
			total =  total + parseFloat($(this).html());
		});
		$('.turnover_total_sales').html(total.toFixed(2).replace(".", ",") + " €");
	});

	$(function(){
		var total = 0
		$('.margin_web').each(function(){
			total =  total + parseFloat($(this).html());
		});
		$('.total_margin_web').html(total.toFixed(2).replace(".", ",") + " €");
	});

	$(function(){
		var total = 0
		$('.margin_sales').each(function(){
			total =  total + parseFloat($(this).html());
		});
		$('.total_margin_sales').html(total.toFixed(2).replace(".", ",") + " €");
	});

});