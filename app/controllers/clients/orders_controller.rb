class Clients::OrdersController < Clients::ApplicationController

	before_action :find_order, only: [:show, :edit, :update]

	def index
		if params[:status]
			@client_orders = Order.where(user_id: current_user.id).filter_by_status(params[:status]).paginate(page: params[:page], per_page: 3)
		else
			@client_orders = Order.where(user_id: current_user.id).paginate(page: params[:page], per_page: 3)
		end
	end

	def show
		respond_to do |format|
		  format.html { }
		  format.pdf do 
		    html = render_to_string(template: "clients/orders/show.pdf.erb", layout: "layouts/application.pdf.erb", orientation: "Landscape" )
		    pdf = WickedPdf.new.pdf_from_string(html)
		    send_data(pdf, filename: "order.pdf", type: "application/pdf", disposition: 'attachment')     
		  end
		end
	end

	def new
		@order = current_cart.order
		@billing_address = BillingAddress.new
	end

	def create
		@order = current_cart.order
		@order.update_sub_total!
		@order.update_total!
		@order.set_total_weight
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


	def update
		if @order.update_attributes(status: "cancelled")
			redirect_to clients_order_path(@order), notice: "Votre commande a bien été annulée"
			OrderMailer.cancel_order(@order).deliver_now
			OrderMailer.confirm_cancel_order(@order).deliver_now
		end
	end


	def edit
	end

	private

	def find_order
		@order = Order.find(params[:id])
	end

	def order_params
		params.require(:order).permit(:status,  :user_id, :token , :sub_total, :gcos_accepted)
	end
end
