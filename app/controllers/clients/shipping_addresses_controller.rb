class Clients::ShippingAddressesController <  Clients::ApplicationController

	before_action :set_shipping_address, only:  [:edit, :update, :destroy]

	def new
		@shipping_address  =  ShippingAddress.new
	end

	def create
		@shipping_address  =  ShippingAddress.new(shipping_address_params)
		@shipping_address.user_id = current_user.id
		if @shipping_address.save!
			if current_cart.order.items.count > 0
				redirect_to clients_cart_checkout_path, notice: "L'adresse a bien été ajoutée"
			else
				redirect_to clients_user_path(current_user), notice: "L'adresse a bien été ajoutée"
			end
		else
			render :new
		end
	end

	def edit
		@shipping_address = ShippingAddress.find(params[:id])
	end

	def update
		if @shipping_address.update_attributes(shipping_address_params)
			if current_cart.order.items.count > 0
				redirect_to clients_cart_checkout_path, notice: "L'adresse a bien été modifiée"
			else
				redirect_to clients_user_path(current_user), notice: "L'adresse a bien été modifiée"
			end
		end
	end

	def destroy
		if @shipping_address.destroy!
			redirect_to root_path, notice: "L'adresse a bien été supprimée"
		end
	end

	private

	def set_shipping_address
		@shipping_address = ShippingAddress.find(params[:id])
	end

	def shipping_address_params
	 	params.require(:shipping_address).permit(:first_name, :last_name, :address_1, :address_2, :user_id, :city, :zipcode, :phone)
	end
end
