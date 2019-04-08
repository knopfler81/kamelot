class Admin::ReturningsController < Admin::ApplicationController

	before_action :find_returning, only: [:show, :edit, :update]
	 
	def index
		@returnings = Returning.order('created_at DESC').paginate(page: params[:page], per_page: 10)
	end

	def edit
	end

	def show
	end

	def update
		if @returning.update_attributes(returning_params)
			if @returning.status == "confirmed"
				ReturningMailer.received_returning(@returning).deliver_now
			end
			redirect_to admin_returning_path(@returning)
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
