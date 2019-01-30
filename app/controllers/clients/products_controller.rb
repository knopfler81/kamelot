class Clients::ProductsController < Clients::ApplicationController


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

	def filter_products
	  return if params[:query].blank?
	  @products = Product.where('lower(title) LIKE ?', "%#{params[:query][:keyword].downcase}%")
	  .or(Product.where('lower(description) LIKE ?', "%#{params[:query][:keyword].downcase}%"))
	  .or(Product.where('lower(color) LIKE ?', "%#{params[:query][:keyword].downcase}%"))
	end


end
