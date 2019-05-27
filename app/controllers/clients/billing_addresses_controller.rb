class Clients::BillingAddressesController <  Clients::ApplicationController

	before_action :set_billing_address, only:  [:edit, :update, :destroy]

	def new
		@billing_address  = BillingAddress.new
	end

	def create
		@billing_address  =  BillingAddress.new(billing_address_params)
			@billing_address.user_id = current_user.id
			if @billing_address.save
				if current_cart.order.items.count > 0
					redirect_to clients_cart_checkout_path, notice: "L'adresse a bien été ajoutée"
				else
					redirect_to clients_user_path(current_user), notice: "L'adresse a bien été ajoutée"
				end
			else
				render :new, alert: "woooops.... "
			end
	end

	def edit
		@billing_address = BillingAddress.find(params[:id])
	end


	def update
		if @billing_address.update_attributes(billing_address_params)
			if current_cart.order.items.count > 0
				redirect_to clients_cart_checkout_path, notice: "L'adresse a bien été modifiée"
			else
				redirect_to clients_user_path(current_user), notice: "L'adresse a bien été modifiée"
			end
		end
	end


	def destroy
		if @billing_address.destroy!
			redirect_to root_path, notice: "L'adresse a bien été supprimée"
		end
	end

	private

	def set_billing_address
		@billing_address = BillingAddress.find(params[:id])
	end

	def billing_address_params
	 	params.require(:billing_address).permit(:first_name, :last_name, :address_1, :address_2, :user_id, :city, :zipcode, :user_id, :country)
	end
end
