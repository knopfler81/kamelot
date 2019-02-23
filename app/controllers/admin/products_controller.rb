class Admin::ProductsController < Admin::ApplicationController
	protect_from_forgery
	before_action :authenticate_user!, only: [:new, :create,:destroy , :update, :edit]
	before_action :find_product, only: [:show, :destroy, :update, :edit]

	require 'rqrcode'

	def index
		filter_products if params[:query].present?
    @products ||= Product.all
	end

	def desktop
 		filter_products if params[:query].present?
    @products ||= Product.all
	end

	def show
		@products = Product.all
		@product_size_options = @product.sizes.where('quantity >=1')
	end

	def new
		@product = Product.new
		@product.sizes.build
	end

	def edit
	end

	def qr_codes
		@categories = Category.all
		@products = Product.all
	end
	def create
		@product =  Product.new(params_product)
		@product.user_id = current_user.id
		if @product.save
			redirect_to admin_product_path(@product), notice: "L'article a bien été créé"
		else
			render :new, alert: "Woops une erreur"
		end	
	end

	def destroy
		if	@product.destroy
			redirect_to admin_products_path, notice: "L'article a bien été supprimé"
		else
			render :show, alert: "Wooops"
		end
	end

	def update
		if @product.update_attributes(params_product)
			respond_to do |format|
				format.html {redirect_to admin_product_path(@product), notice: "L'article a bien été modifié"}
				format.js
			end
		else
			render :edit, alert: "Woooops"
		end
	end

	private
	
	def find_product
		@product = Product.find(params[:id])
	end

	def find_size
		@size = Size.find(params[:product_id])
	end

	def params_product
		params.require(:product).permit(:id, :user_id, :title, :ref, :brand, :description, :buying_price, :price, :category_id, :color, :qr_code,{ attachments:[]}, sizes_attributes: [:id, :size_name, :quantity, :_destroy])
	end

	def filter_products
	  return if params[:query].blank?
	  @products = Product.where('lower(title) LIKE ?', "%#{params[:query][:keyword].downcase }%")
	  .or(Product.where('lower(description) LIKE ?', "%#{params[:query][:keyword].downcase }%"))
	  .or(Product.where('lower(color) LIKE ?', "%#{params[:query][:keyword].downcase }%"))
	end
end