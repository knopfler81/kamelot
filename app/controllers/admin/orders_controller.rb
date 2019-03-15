class Admin::OrdersController < Admin::ApplicationController

	def index	
		if params[:status].present? 
			@orders = Order.filter_by_status(params[:status]).paginate(page: params[:page], per_page: 10)
		 else
			@orders = Order.where.not(user_id: nil).order('created_at DESC').paginate(page: params[:page], per_page: 10)
		end
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
		params.require(:order).permit(:status,  :user_id, :token , :gcos_accepted, :sub_total)
	end
end