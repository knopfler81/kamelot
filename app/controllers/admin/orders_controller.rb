class Admin::OrdersController < ApplicationController

	def index
		@orders = Order.order('created_at DESC')
		@orders = @orders.filter_by_status(params[:status]) if params[:status]
	end

	def show

		@order = Order.find(params[:id])
	end

	def edit 
		@order = Order.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])
		@order.update_attributes(order_params)
		redirect_to admin_order_path(@order)
	end

	private

	def order_params
		params.require(:order).permit(:status,  :user_id, :token , :sub_total)
	end
end