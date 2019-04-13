class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :phone, :birth_date, :gender, :email, :email_confirmation, :password, :password_confirmation, :list_subscriber)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :phone, :birth_date, :gender, :email, :email_confirmation, :password, :password_confirmation, :list_subscriber)
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_sign_up_path_for(resource)
    new_clients_shipping_address_path
  end
end