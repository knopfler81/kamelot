class Admin::StocksController < Admin::ApplicationController

	def show
		@stock = Stock.find(params[:id])
	end

	def index
		filter_stocks if params[:query].present?
		@stocks ||= Stock.joins(:variant).order('variants.product_id')
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


	def stock
		@variants = @product.variants
	end



	private

	def stock_params
		params.require(:stock).permit(:id, :quantity, :variant_id, :initial_quantity , :supplier_id, :cost_price, :price,)
	end

	def find_variant
		@variant = Variant.find(stock_params[:variant_id])
	end


	def filter_stocks
		@stocks = Stock.joins(variant: :product).where('lower(products.title) LIKE ?', "%#{params[:query][:keyword].downcase }%")
			.or( Stock.joins(variant: :product).where('lower(products.brand) LIKE ?', "%#{params[:query][:keyword].downcase }%"))
	end
end
