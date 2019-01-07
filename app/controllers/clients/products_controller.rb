class Clients::ProductsController < ApplicationController

	before_action :set_product

	def index
		@products = Product.all
	end

	def show
		@products = Product.all
	end

	private
	
	def set_product
		@product = Product.find(params[:id])
	end

	def params_product
		params.require(:product).permit(:title, :description, :price, :category_id, :color, { attachments:[]}, sizes_attributes: [:id, :size_name, :quantity, :_destroy])
	end
end