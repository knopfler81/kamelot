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
		if @order.all_missing?
			OrderMailer.we_are_sorry(@order).deliver_now
			# remplacer par un email qui explique rien est dispo
			@order.cancelled_by_admin!
			@order.update_sub_total!
			@order.update_total!
		elsif @order.confirmed?
			debit_payment
		elsif @order.full_shipped? || @order.partly_shipped?
			OrderMailer.order_sent(@order).deliver_now
		elsif @order.missing_item?
			@order.update_sub_total!
			@order.update_total!
			OrderMailer.we_are_sorry(@order).deliver_now
			debit_payment
			@order.partly_paid!
		end
		  redirect_to admin_order_path(@order)
	end


	private

def debit_payment
	@order = Order.find(params[:id])
	charge = Stripe::Charge.retrieve(@order.charge_id)
	# https://stripe.com/docs/charges#auth-capture
	charge.capture(amount: @order.total_cents)
	if charge.captured?
		@order.update_attributes!(status: 'paid')
		# it works, the debit was ok
	else
		@order.update_attributes!(status: 'pending')
		redirect_to admin_order_path(@order), alert: "Oulala ca marche pas"
	end
end


	def filter_orders
		@orders = Order.joins(:user).where('lower(users.last_name) LIKE ?', "%#{params[:query][:keyword].downcase }%")
		.or(Order.joins(:user).where('lower(users.first_name) LIKE ?', "%#{params[:query][:keyword].downcase }%"))
	end
	
	def order_params
		params.require(:order).permit(:status, :charge_id, :user_id, :token , :gcos_accepted, :sub_total)
	end
end