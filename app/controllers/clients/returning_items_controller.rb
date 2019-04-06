class Clients::ReturningItemsController < Clients::ApplicationController

	def create
	end

	def index
		find_returing
		@returning_items = ReturningItem.where(returning_id: @returning.id)
		@order = Order.find(params[:order_id])
	end


	def edit
	end


	def update
		@returning_item = ReturningItem.find(params[:id])
		@returning_item.update_attributes(returning_item_params)
	end


	private

	def find_returing
		@returning = Returning.find(params[:returning_id])
	end

	def returning_item_params
		params.permit(:id, :returning_id, :order_item_id, :selected, :reason)
	end
end