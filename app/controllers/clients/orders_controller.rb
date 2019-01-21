class Clients::OrdersController < ApplicationController

	def index
		@orders = Order.where(user_id: !nil).paginate(page: params[:page], per_page: 5)
		@orders = @orders.filter_by_status(params[:status]) if params[:status]
	end

	def show
		@order = Order.find(params[:id])
	end

	def new
		@billing_address = BillingAddress.new
		@shipping_address = ShippingAddress.new
		# @user = current_user
		@order = current_cart.order
	end

	def create
		@order = current_cart.order
		if @order.update_attributes!(user_id: current_user.id)
    	redirect_to new_clients_order_payment_path(@order)
		end
	end

	def order_params
		params.require(:order).permit(:status,  :user_id, :token , :sub_total)
	end

end
