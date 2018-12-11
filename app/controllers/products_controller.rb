class ProductsController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create,:destroy , :update, :edit]
	before_action :set_product, only: [:show, :destroy, :update, :edit]

	def index
		@products = Product.all
	end

	def show
	end

	def new
		@product = Product.new
	end

	def create
		@product =  Product.new(params_product)
		if @product.save!
			redirect_to @product, notice: "Créé avec succès"
		else
			render :new, alert: "Woops une erreur"
		end

	end

	def destroy
		if	@product.destroy
			redirect_to categories_path, notice: "Supprimé avec succès"
		else
			render :show, alert: "Wooops"
		end
	end

	def edit
	end

	def update
		if @product.update_attributes(params_product)
			redirect_to @product
		else
			render :edit, alert: "Woooops"
		end
	end


	private
	
	def set_product
		@product = Product.find(params[:id])
	end

	def params_product
		params.require(:product).permit(:title, :description, :price, :category_id)
	end
end