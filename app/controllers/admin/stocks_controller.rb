class Admin::StocksController < Admin::ApplicationController

	def show
		@stock = Stock.find(params[:id])
	end

	def index
		@stocks = Stock.all
		@variants = Variant.all
	end

	def new 
		@stock = Stock.new
		@product = Product.find(params[:product_id])
		@variants = @product.variants
	end

	def create
		find_variant
		@product = @variant.product
		@stock = Stock.new(stock_params)
		if @stock.save
			redirect_to  stock_admin_product_path(@product)
		else
			redirect_to stock_admin_product_path(@product), alert: "Woops"
		end
	end

	private

	def stock_params
		params.require(:stock).permit(:id, :quantity, :variant_id )
	end

	def find_variant
		@variant = Variant.find(stock_params[:variant_id])
	end
end
