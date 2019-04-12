class Clients::ReturningItemsController < Clients::ApplicationController

	def index
		@order = Order.find(params[:order_id])
		find_returing
		@returning_items = ReturningItem.where(returning_id: @returning.id).order('created_at ASC')
	end

	def edit
	end

	def update
		@order = Order.find(params[:order_id])
		find_returing
	  @returning_item = ReturningItem.find(params[:id])
		@returning_item.update_attributes(returning_item_params)
		@order = Order.find(params[:order_id])
		find_returing
	  @returning_item = ReturningItem.find(params[:id])
		respond_to do |format|
			if	@returning_item.update_attributes(returning_item_params)
			 format.js
			 format.html {redirect_to clients_order_returning_returning_items_path(@order, @returning), notice: "Ca marche"}
			else
				format.js
				format.html {redirect_to clients_order_returning_returning_items_path(@order, @returning), notice: "C'est la merde"}
			end
		 end
	end

	private

	def find_returing
		@returning = Returning.find(params[:returning_id])
	end

	def returning_item_params
		params.permit(:id, :returning_id, :variant_id, :order_item_id,  :state, :quantity, :selected, :price)
	end
end