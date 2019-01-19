class Admin::ProductsController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create,:destroy , :update, :edit]
	before_action :set_product, only: [:show, :destroy, :update, :edit]

	def index
		@products = Product.all
	end

	def show
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		if current_user.admin
			@product =  Product.new(params_product)
			@product.user_id = current_user.id

			if @product.save!
				redirect_to admin_product_path(@product), notice: "Créé avec succès"
			else
				render :new, alert: "Woops une erreur"
			end
		else
			redirect_to root_path,  alert: "Vous n'êtes pas autorisé 😡"
		end
	end

	def destroy
		if current_user.admin
			if	@product.destroy
				redirect_to admin_categories_path, notice: "Supprimé avec succès"
			else
				render :show, alert: "Wooops"
			end
		end
	end

	def edit
		unless current_user.admin?
			redirect_to root_path,  alert: "Vous n'êtes pas autorisé 😡"
		end
	end

	def update
		if @product.update_attributes!(params_product)
			redirect_to admin_product_path(@product), notice: "Modifié avec succès"
		else
			render :edit, alert: "Woooops"
		end
	end

	private
	
	def set_product
		@product = Product.find(params[:id])
	end

	def params_product
		params.require(:product).permit(:title, :brand, :description, :price_cents, :category_id, :color, { attachments:[]}, sizes_attributes: [:id, :size_name, :quantity, :_destroy])
	end
end