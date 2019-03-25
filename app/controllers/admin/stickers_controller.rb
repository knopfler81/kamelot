class Admin::StickersController < Admin::ApplicationController
	protect_from_forgery
	before_action :authenticate_user!, only: [:new, :create,:destroy , :update, :edit]
	before_action :find_product

	def new
		@sticker = Sticker.new
	end

	def create
		@sticker = Sticker.new(sticker_params)
		if @sticker.save!
			redirect_to admin_product_sticker_path(@product, @sticker), notice: "Weeeeeee"
		end
	end

	def show
		@sticker = Sticker.find(params[:id])
	end

	def index
		@stickers = Sticker.all
	end

	private

	 def sticker_params
	 	params.require(:sticker).permit(:quantity, :product_id)
	 end

	 def find_product
	 	@product = Product.find(params[:product_id])
	 end
end