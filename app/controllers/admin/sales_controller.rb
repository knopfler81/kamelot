class Admin::SalesController < Admin::ApplicationController
		def index
			@sales = Sale.all
		end

		def show
			@sale = Sale.find(params[:id])
		end

		def new
			@sale = current_basket.sale
		end

		def create
			@sale = current_basket.sale
			@sale.update_attributes(status: 1)
			@sale.remove_from_stock
			session[:basket_token] == nil
			@sale.update_total!
			if @sale.save
			 	redirect_to admin_sales_path, notice: "Vente enregistrée"
			 else
			 	redirct_to admin_basket_path, alert: "Ohoh Houston on a un problème..."
			 end
		end

		private

		def sale_params
			params.require(:sale).permit(:user_id, :token , :sub_total, :status)
		end
end
