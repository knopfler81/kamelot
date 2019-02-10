class Clients::UsersController < Clients::ApplicationController

	def show
	end

	def addresses
	end

	def favorites
	 @favorites = favorite.where(user_id: current_user.id)
	end

	private

	def user_params
	  params.require(:user).permit(:first_name, :last_name, :birth_date, :gender, :email, :password, :password_confirmation)
	end
end
