class Admin::ProductsController < Admin::ApplicationController
	protect_from_forgery
	before_action :authenticate_user!, only: [:new, :create,:destroy , :update, :edit]
	before_action :find_product, only: [:show, :destroy, :update, :edit, :stock, :stickers]

	require 'rqrcode'

	def index
		if params[:query].present?
			@products = filter_products.left_joins(variants: :stocks).group(:id).select(Product.arel_table[Arel.star],Stock.arel_table[:quantity].sum.as('total_quantity')).order('total_quantity DESC').paginate(page: params[:page], per_page: 12).order('created_at DESC')
		else
    	@products = Product.all.left_joins(variants: :stocks).group(:id).select(Product.arel_table[Arel.star],Stock.arel_table[:quantity].sum.as('total_quantity')).order('total_quantity DESC').paginate(page: params[:page], per_page: 12).order('created_at DESC')
    end
	end

	def list
		filter_products if params[:query].present?
		@products ||= Product.order('created_at DESC')
	end

	def show
		@products = Product.all
		@product_size_options = []
		if @product.variants.any?
			@product.variant_types.map do |var| 
				if var.remaining_stock >= 1
					@product_size_options  << var
				end
		  end
		end
	end

	def new
		@product = Product.new
		@main_categories = MainCategory.all
		@categories = Category.all
	end

	def edit
		@product.variants
	end

	def qr_codes
		@categories = Category.all
		@products = Product.all
	end

	def create
		@main_categories = MainCategory.all
		@categories = Category.all
		@product =  Product.create!(params_product)
		@product.user_id = current_user.id
		if @product.save
			redirect_to edit_admin_product_path(@product), notice: "L'article a bien été créé"
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
				format.html {redirect_to stock_admin_product_path(@product), notice: "L'article a bien été modifié" }
				format.js
			end
		else
			render :edit, alert: "Woooops"
		end
	end

	def stock
		@variants = @product.variants.order('created_at DESC')
	end


	def stickers
	end

	def clone
	  @product = Product.find(params[:id]).dup
	  render :new
	end


	private
	
	def find_product
		@product = Product.friendly.find(params[:id])
	end

	def params_product
		params.require(:product).permit(:id, :user_id, :title, :ref, :brand, :description, :weight, :buying_price, :price, :market_price, :category_id, :supplier_id, :color, :qr_code, :discounted_price, :discount_percentage,{ attachments:[]}, variants_attributes: [:id, :size, :color, :price, :cost_price, :supplier_id, :_destroy])
	end

	def filter_products
	  return if params[:query].blank?
	  @products = Product.where('lower(title) LIKE ?', "%#{params[:query][:keyword].downcase }%")
	  .or(Product.where('lower(color) LIKE ?', "%#{params[:query][:keyword].downcase }%"))
	  .or(Product.where('lower(description) LIKE ?', "%#{params[:query][:keyword].downcase }%"))
	end
end