class Clients::UsersController < ApplicationController


	def show
	end

	def addresses
	end

	def favorites
	 @favorites = favorite.where(user_id: current_user.id)
	end

	private

	def user_params
	  params.require(:user).permit(:first_name, :last_name, :address_1, :address_2, :city, :zipcode, :country, :phone, :birth_date, :gender, :email, :password, :password_confirmation)
	end
end
