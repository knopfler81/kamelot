class Admin::OrdersController < Admin::ApplicationController

	def index	
		if params[:status].present? 
			@orders = Order.filter_by_status(params[:status]).paginate(page: params[:page], per_page: 10)
		elsif params[:query].present? 
			@orders = filter_orders.paginate(page: params[:page], per_page: 10)
		else
			@orders = Order.where.not(user_id: nil).order('created_at DESC').paginate(page: params[:page], per_page: 10)
		end
		# respond_to do |format|
  #     format.html
  #     format.csv { send_data @orders.to_csv }
  #   end
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
		if @order.finished?
			OrderMailer.order_sent(@order).deliver_now
			redirect_to admin_order_path(@order)
		elsif @order.confirmed?
			redirect_to admin_order_path(@order)
		elsif @order.partially_refunded?
			redirect_to admin_order_path(@order)
		elsif @order.totally_refunded?
			redirect_to admin_order_path(@order)
		elsif @order.cancelled_by_admin? 
			redirect_to admin_order_path(@order)
		elsif @order.missing_item?
			@order.update_sub_total!
			@order.update_total!
			OrderMailer.we_are_sorry(@order).deliver_now
			redirect_to admin_order_path(@order)
		end
	end

	private

	def filter_orders
		@orders = Order.joins(:user).where('lower(users.last_name) LIKE ?', "%#{params[:query][:keyword].downcase }%")
		.or(Order.joins(:user).where('lower(users.first_name) LIKE ?', "%#{params[:query][:keyword].downcase }%"))
	end
	
	def order_params
		params.require(:order).permit(:status,  :user_id, :token , :gcos_accepted, :sub_total)
	end
end