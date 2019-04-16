class Clients::ProductsController < Clients::ApplicationController

	def index
		if params[:query].present?
			@client_products = filter_products.paginate(page: params[:page], per_page: 12) 
		else
    	@client_products = Product.all.paginate(page: params[:page], per_page: 12)
    end
	end

	def show
		set_product
		@products = Product.all
		@product_size_options = []	
		@product.variants.map do |var| 
			if var.has_stock == true
				@product_size_options  << var
			end
	  end
	end

	private
	
	def set_product
		@product = Product.friendly.find(params[:id])
	end

	def filter_products
	  return if params[:query].blank?
	  @products = Product.where('lower(title) LIKE ?', "%#{params[:query][:keyword]}%")
	  .or(Product.where('lower(description) LIKE ?', "%#{params[:query][:keyword]}%"))
	  .or(Product.where('lower(color) LIKE ?', "%#{params[:query][:keyword]}%"))
	end
end
