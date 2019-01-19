class Clients::OrdersController < ApplicationController
	include ShoppingCartsHelper

	def index
		@orders = Order.all
		@orders = @orders.filter_by_status(params[:status]) if params[:status]
	end

	def show
		@order = Order.find(params[:id])
	end

	def new
		@billing_address = BillingAddress.new
		@shipping_address = ShippingAddress.new

		@user = current_user

		@order = current_cart.order
	end

	def create
		@user = current_user

		@order = current_cart.order 

    redirect_to new_clients_order_payment_path(@order)
	end
end
