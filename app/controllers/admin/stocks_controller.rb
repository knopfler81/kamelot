class Admin::StocksController < Admin::ApplicationController

	def show
		@stock = Stock.find(params[:id])
	end

	def index
		if params[:query].present?
			@stocks = filter_stocks.paginate(page: params[:page], per_page: 10)
		else
			@stocks = Stock.joins(:variant).order('variants').order('created_at ASC').paginate(page: params[:page], per_page: 10)
		end
	end

	def new 
		@stock = Stock.new
		@product = Product.find(params[:product_id])
		@variants = @product.variants.order("updated_at DESC")
	end

	def create
		find_variant
		@product = @variant.product
		@stock = Stock.new(stock_params)
		if @stock.save
			redirect_to  stock_admin_product_path(@product), notice: "Vous venez d'ajouter #{@stock.quantity} articles dans la variante  \" #{@stock.variant.size} #{@stock.variant.color} \" pour #{@stock.variant.product.title}"
		else
			redirect_to stock_admin_product_path(@product), alert: "Woops petit soucis, recommencez"
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
		@stocks = Stock.joins(variant: :product).order('variants').order('created_at ASC').where('lower(products.title) LIKE ?', "%#{params[:query][:keyword].downcase }%")
			.or( Stock.joins(variant: :product).order('variants').order('created_at ASC').where('lower(products.brand) LIKE ?', "%#{params[:query][:keyword].downcase }%"))
	end
end
