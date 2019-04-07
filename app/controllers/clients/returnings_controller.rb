class Clients::ReturningsController < Clients::ApplicationController
	before_action :find_returning

	def edit
	end

	def show
	end

	def update
		if @returning.update_attributes(returning_params)
			redirect_to clients_order_returning_path(@returning), notice: "Votre retour a bien été envoyé"
		end
	end

	private

	def find_returning
		@returning = Returning.find(params[:id])
	end
	
	def returning_params
		params.require(:returning).permit(:order_id, :limit_date, :status, :number, :reason)
	end
end