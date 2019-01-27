class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
  	params.require(:user).permit(:first_name, :last_name, :address_1, :address_2, :city, :zipcode, :country, :phone, :birth_date, :gender, :email, :password, :password_confirmation)
  end

  def account_update_params
   	params.require(:user).permit(:first_name, :last_name, :address_1, :address_2, :city, :zipcode, :country, :phone, :birth_date, :gender, :email, :password, :password_confirmation)
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end