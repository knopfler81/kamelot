class Clients::ReturningsController < Clients::ApplicationController
	before_action :find_returning, except: :index

	def index
		@client_returnings = Returning.where(user_id: current_user.id).paginate(page: params[:page], per_page: 3)
	end

	def edit
	end

	def show
	end

	def update
		if @returning.update_attributes(returning_params)
			if @returning.status == "pending"
				redirect_to clients_order_returning_path(@returning), notice: "Votre retour a été demandé"
				ReturningMailer.send_returning(@returning).deliver_now
			else
				redirect_to clients_order_returning_path(@returning), notice: "YO!"
			end
		end
	end

	private

	def find_returning
		@returning = Returning.find(params[:id])
	end
	
	def returning_params
		params.require(:returning).permit(:order_id, :limit_date, :status, :number, :reason, :user_id)
	end
end