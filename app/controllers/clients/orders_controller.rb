class Clients::OrdersController < Clients::ApplicationController

	before_action :find_order, only: [:show, :edit, :update]
	before_action :set_cache_buster, only: [:edit, :show]

	def index
		if params[:status]
			@client_orders = Order.where(user_id: current_user.id).filter_by_status(params[:status]).paginate(page: params[:page], per_page: 10)
		else
			@client_orders = Order.where(user_id: current_user.id).paginate(page: params[:page], per_page: 3)
		end
	end

	def show
		@returning = Returning.find_by(order_id: @order.id)
		respond_to do |format|
		  format.html { }
		  format.pdf do
		    html = render_to_string(template: "clients/orders/show.pdf.erb", layout: "layouts/clients/application.pdf.erb", orientation: "Landscape", page_size: 'A4', encoding:"UTF-8" )
		    pdf = WickedPdf.new.pdf_from_string(html)
		    send_data(pdf, filename: "commande_#{@order.number}.pdf", type: "application/pdf", disposition: 'attachment')     
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
	 	if @order.update_attributes(order_params)
	 		if @order.return_asked?
		 		@returning = Returning.find_by(order_id: @order.id)
		 		redirect_to clients_order_returning_returning_items_path(@order, @returning)
	 		else
	 			redirect_to clients_order_path(@order)
	 			@order.cancelled_order if @order.cancelled_by_client?
	 		end
	 	end
	end

	def edit
	end

	protected

	def set_cache_buster
	  response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
	  response.headers["Pragma"] = "no-cache"
	  response.headers["Expires"] = "#{1.year.ago}"
	end

	private

	def find_order
		@order = Order.find(params[:id])
	end

	def order_params
		params.require(:order).permit(:status,  :charge_id, :user_id, :token , :return_asked, :return_limit_date, :number, :sub_total, :gcos_accepted)
	end
end
