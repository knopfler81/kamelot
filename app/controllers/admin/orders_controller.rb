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
		if @order.confirmed?
			debit_payment
		elsif @order.full_shipped?
			OrderMailer.order_sent(@order).deliver_now
		elsif @order.missing_item?
			@order.update_sub_total!
			@order.update_total!
			OrderMailer.we_are_sorry(@order).deliver_now
		end
	end


	private

	def debit_payment
		@order = Order.find(params[:id])
		charge = Stripe::Charge.retrieve(@order.charge_id)
		# https://stripe.com/docs/charges#auth-capture
		charge.capture(amount: @order.total_cents)
		if charge.captured?
			@order.update_attributes!(status: 'paid')
			redirect_to admin_order_path(@order), notice: "La commande est encaissée"
			# it works, the debit was ok
		else
			# it didn't work
			redirect_to admin_order_path(@order), alert: "Oulala ca marche pas"
		end
	end


	def filter_orders
		@orders = Order.joins(:user).where('lower(users.last_name) LIKE ?', "%#{params[:query][:keyword].downcase }%")
		.or(Order.joins(:user).where('lower(users.first_name) LIKE ?', "%#{params[:query][:keyword].downcase }%"))
	end
	
	def order_params
		params.require(:order).permit(:status,  :user_id, :token , :gcos_accepted, :sub_total)
	end
end