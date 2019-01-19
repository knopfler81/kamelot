class ShippingAddressesController < ApplicationController

	before_action :set_shipping_address, only:  [:edit, :update, :destroy]

	def new
		@shipping_address  = ShippingAddress.new
	end

	def create
		@user = current_user
		@shipping_address = ShippingAddress.new(shipping_address_params)
		if @shipping_address.save!
			redirect_to clients_checkout_path
		else
			render :new, alert: "PLOC"
		end
	end

	# def show
	# 	@shipping_address = ShippingAddress.find(params[:id])
	# end

	def edit
		@shipping_address = ShippingAddress.find(params[:id])
	end


	def update
		if @shipping_address.update_attributes(shipping_address_params)
			
			redirect_to clients_checkout_path,  notice: "L'adresse a bien été modifiée"
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
	 	params.require(:shipping_address).permit(:address_1, :address_2, :user_id, :zipcode, :city, :phone, :title, :first_name, :last_name)#order_id
	end


end
