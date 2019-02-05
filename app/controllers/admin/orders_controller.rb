class Admin::OrdersController < Admin::ApplicationController

	def index
		@orders = Order.where.not(user_id: nil).order('created_at DESC').paginate(page: params[:page], per_page: 10)
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

		if @order.status == "cancelled"
			OrderMailer.we_are_sorry(@order).deliver_now
			redirect_to admin_order_path(@order)
		elsif @order.status == "shipped"
			OrderMailer.order_sent(@order).deliver_now
			redirect_to admin_order_path(@order)
		elsif @order.status == "confirmed"
			redirect_to admin_order_path(@order)
		end

	end

	private

	def order_params
		params.require(:order).permit(:status,  :user_id, :token , :sub_total)
	end
end