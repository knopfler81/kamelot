class Clients::ProductsController < Clients::ApplicationController

	def index
		if params[:query].present?
			@client_products = filter_products.paginate(page: params[:page], per_page: 12).order('created_at DESC')
		else
    	@client_products = Product.all.paginate(page: params[:page], per_page: 12).order('created_at DESC')
    end
	end

	def show
		set_product
		set_variants
		@products = Product.all
	end


	def promos
		@client_products = Product.where('discount_percentage >?', 0).paginate(page: params[:page], per_page: 12).order('updated_at DESC')
	end

	private
	
	def set_product
		@product = Product.friendly.find(params[:id])
	end

	def filter_products
	  return if params[:query].blank?
	  @products = Product.where('lower(title) LIKE ?', "%#{params[:query][:keyword].downcase }%")
	  .or(Product.where('lower(description) LIKE ?', "%#{params[:query][:keyword].downcase }%"))
	  .or(Product.where('lower(color) LIKE ?', "%#{params[:query][:keyword].downcase }%"))
	  .or(Product.where('lower(brand) LIKE ?', "%#{params[:query][:keyword].downcase }%"))
	end

	def set_variants
		@product_size_options = []	
		@product.variants.map do |var| 
			if var.has_stock == true
				@product_size_options  << var
			end
	  end
	end
end
