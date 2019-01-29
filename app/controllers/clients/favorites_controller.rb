class Clients::FavoritesController < Clients::ApplicationController

	before_action :find_favorite, only: [:destroy]

	def index
		@favorites = Favorite.where(user: current_user).all
	end

	def create
		@product = Product.find(params[:product_id])
		@user = current_user
	  @favorite = Favorite.create(product: @product, user_id: @user.id)

		if @favorite.save
	   	respond_to do |format|
		   	format.js
		   	format.html {redirect_to clients_products_path(@product)}
		  end
		else
			respond_to do | format|
				format.js 
				format.html {redirect_to clients_products_path,  alert: "HOPHOP" }
			end
	 	end
	end



	def destroy 
	 	if @favorite.destroy!
	 		respond_to do |format|
	 			format.js 
	 		end
	 	end
	end

	private

	def find_product
		@product = Product.find(params[:product_id])
	end


	def find_favorite
		find_product
	   @favorite = @product.favorites.find(params[:id])
	end
end