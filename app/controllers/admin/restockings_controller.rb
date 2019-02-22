class Admin::RestockingsController < Admin::ApplicationController

	def new
		@product = Product.find(params[:product_id])
    @restocking = Restocking.new
	end

	def create
		@restocking = Restocking.new(restocking_params)
		if @restocking.save!
			@restocking.update_existing_product
			redirect_to admin_products_path
		end
	end

	def restocking_params
		params.require(:restocking).permit(:id, :product_id, :buying_price, :price,  sizes_attributes: [:id, :size_name, :quantity, :_destroy])
	end


	def find_product
		@product = Product.find(params[:product_id])
	end
end
