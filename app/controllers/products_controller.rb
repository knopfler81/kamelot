
	class ProductsController < ApplicationController

		before_action :authenticate_user!, only: [:new, :create,:destroy , :update, :edit]
		before_action :set_product, only: [:show, :destroy, :update, :edit]

		def index
			#@products = Product.all
			@products = policy_scope(Product)
		end

		def show
		end

		def new
			@product = Product.new
			authorize @product
		end

		def create
			if current_user.admin
				@product =  Product.new(params_product)
				@product.user_id = current_user.id
				authorize @product
				if @product.save!
					redirect_to @product, notice: "Créé avec succès"
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
					redirect_to categories_path, notice: "Supprimé avec succès"
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
			if @product.update_attributes(params_product)
				redirect_to @product
			else
				render :edit, alert: "Woooops"
			end
		end


		private
		
		def set_product
			@product = Product.find(params[:id])
			authorize @product
		end

		def params_product
			params.require(:product).permit(:title, :description, :price, :quantity, :category_id, :size, :color)
		end
	end
