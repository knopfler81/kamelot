class Clients::OrdersController < ApplicationController

	def index
		@orders = Order.all
		@orders = @orders.filter_by_status(params[:status]) if params[:status]
	end

	def show
		@order = Order.find(params[:id])
	end

	def new
		@order = current_cart.order
	end

	def create
		@order = current_cart.order 
		if @order.update_attributes(order_params.merge(status: 1))
			session[:cart_token] == nil
			redirect_to root_path, notice: "Merci"
			@order.remove_from_stock
		else
			render :new
		end

	end

	private

	def order_params
		params.require(:order).permit(:status)
	end
end
