class Clients::ProductsController < ApplicationController

	def index
		filter_products if params[:query].present?
    @products ||= Product.all
	end

	def show
		set_product
		@products = Product.all
	end

	private
	
	def set_product
		@product = Product.find(params[:id])
	end

	def params_product
		params.require(:product).permit(:title, :description, :price, :category_id, :color, { attachments:[]}, sizes_attributes: [:id, :size_name, :quantity, :_destroy])
	end

	def filter_products
	  return if params[:query].blank?
	  @products = Product.where('lower(title) LIKE ?', "%#{params[:query][:keyword]}%")
	  .or(Product.where('lower(description) LIKE ?', "%#{params[:query][:keyword]}%"))
	  .or(Product.where('lower(color) LIKE ?', "%#{params[:query][:keyword]}%"))
	  #@products = Product.joins(:category).where('lower(categories.title) LIKE ?', "%#{params[:query][:keyword]}%")
	end

end
