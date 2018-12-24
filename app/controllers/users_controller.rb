class UsersController < ApplicationController

	def index
		@users = policy_scope(User)
	end

	def show
		@user = User.find(params[:id])
		authorize @user
	end

	private
	
  def user_params
    params.require(:user).permit(:first_name, :last_name, :address_1, :address_2, :city, :zipcode, :phone, :email, :password, :password_confirmation)
  end
end