class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception
	
	
  before_action :current_cart
  
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def current_cart
    @current_cart ||= ShoppingCart.new(token: cart_token)
  end
  
  helper_method :current_cart


  private

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def cart_token
    return @cart_token unless @cart_token.nil?

    session[:cart_token] ||= SecureRandom.hex(8)
    @cart_token = session[:cart_token]
  end
end
