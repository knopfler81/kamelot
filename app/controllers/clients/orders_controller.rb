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
		@billing_address = BillingAddress.new
	end

	def create
		@order = current_cart.order
		@order.update_sub_total!
		@order.update_total!
		if @order.update_attributes!(user_id: current_user.id)
    	redirect_to new_clients_order_payment_path(@order)
		end
	end

	private

	def order_params
		params.require(:order).permit(:status,  :user_id, :token , :sub_total)
	end
end
