class Admin::VariantsController < Admin::ApplicationController

	def index
		@variants = Variant.all
	end

	def update
		@variant = Variant.find(params[:id])
		@variant.update_attributes(variant_params)
	end

	def create
		@variant = Variant.new(variant_params)
	end

	private
	def variant_params
		params.require(:variant).permit(:id, :size, :color, :cost_price, :price, :product_id)
	end
end
