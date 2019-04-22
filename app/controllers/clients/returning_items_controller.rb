class Clients::ReturningItemsController < Clients::ApplicationController

	def index
		@order = Order.find(params[:order_id])
		find_returning
		@returning_items = ReturningItem.where(returning_id: @returning.id).order('created_at ASC')
	end

	def edit
	end

	def update
		find_returning
		@order = Order.find(params[:order_id])
		@returning_item = ReturningItem.find(params[:id])
		@returning_item.update_attributes(returning_item_params)
		respond_to do |format|
			if	@returning_item.update_attributes(returning_item_params)
			 format.js
			 format.html {redirect_to clients_order_returning_returning_items_path(@order, @returning)}
			else
				format.js
				format.html {redirect_to clients_order_returning_returning_items_path(@order, @returning)}
			end
		end
	end

	private

	def find_returning
		@returning = Returning.find(params[:returning_id])
	end

	def returning_item_params
		params.permit(:id, :returning_id, :variant_id, :order_item_id,  :state, :quantity, :selected, :price)
	end
end