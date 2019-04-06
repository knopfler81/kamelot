class Clients::ReturningsController < Clients::ApplicationController
	before_action :find_returning

	def edit
	end

	def show
	end

	def update
		@returning.update_attributes(returning_params)
	end

	private

	def find_returning
		@returning = Returning.find(params[:id])
	end
	
	def returning_params
		params.permit(:order_id, :limit_date, :state, :number)
	end
end