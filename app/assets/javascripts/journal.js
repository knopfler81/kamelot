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
		$('.buying_price').each(function(){
			total =  total + parseFloat($(this).html());
		});
		$('.total_buying_price').html(total.toFixed(2) + "€");
	});

	$(function(){
		var total = 0
		$('.cost_price').each(function(){
			total =  total + parseFloat($(this).html());
		});
		$('.total_cost_price').html(total.toFixed(2) + "€");
	});

	$(function(){
		var total = 0
		$('.selling_price').each(function(){
			total =  total + parseFloat($(this).html());
		});
		$('.total_selling_price').html(total.toFixed(2) + "€");
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
		$('.turnover_total_orders').html(total.toFixed(2) + "€");
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
		$('.total_remaining_stock_value').html(total.toFixed(2) + "€");
	});

	$(function(){
		var total = 0
		$('.turnover_sales').each(function(){
			total =  total + parseFloat($(this).html());
		});
		$('.turnover_total_sales').html(total.toFixed(2) + "€");
	});


});