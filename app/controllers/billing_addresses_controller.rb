class BillingAddressesController < ApplicationController

	before_action :set_billing_address, only:  [:edit, :update, :destroy]

	def new
		@billing_address  = BillingAddress.new
	end

	def create
		@user = current_user
		@billing_address = BillingAddress.create(billing_address_params)
		if @billing_address.save!
			redirect_to clients_checkout_path
		else
			render :new, alert: "PLOC"
		end
	end

	# def show
	# 	@billing_address = BillingAddress.find(params[:id])
	# end

	def edit
		@billing_address = BillingAddress.find(params[:id])
	end


	def update
		if @billing_address.update_attributes(billing_address_params)
			
			redirect_to clients_checkout_path,  notice: "L'adresse a bien été modifiée"
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
	 	params.require(:billing_address).permit(:address_1, :address_2, :user_id, :zipcode, :city, :phone, :title, :first_name, :last_name)#order_id
	end


end
