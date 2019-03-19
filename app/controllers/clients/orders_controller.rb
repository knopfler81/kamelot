class Clients::OrdersController < Clients::ApplicationController

	def index
		if params[:status]
			@client_orders = Order.where(user_id: current_user.id).filter_by_status(params[:status]).paginate(page: params[:page], per_page: 3)
		else
			@client_orders = Order.where(user_id: current_user.id).paginate(page: params[:page], per_page: 3)
		end
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
		if @order.update_attributes(order_params.merge(user_id: current_user.id))
			if @order.gcos_accepted == true 
    		redirect_to new_clients_order_payment_path(@order)
    	else
    		redirect_to clients_checkout_path, alert: "Vous devez accepter les conditions générales de vente pour continuer"
    	end
    else
    	redirect_to clients_checkout_path, alert: 'Woooops something went wrong'
		end
	end

	def invoice
		@order = Order.find(params[:id])
		@company = Company.instance
	end

	private

	def order_params
		params.require(:order).permit(:status,  :user_id, :token , :sub_total, :gcos_accepted)
	end
end
