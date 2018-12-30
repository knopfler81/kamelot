class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception
	
	
  before_action :current_cart
  
  include Pundit

  # Pundit: white-list approach.
  #after_action :verify_authorized, except: :index, unless: :skip_pundit?
  #after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def current_cart
    @current_cart ||= ShoppingCart.new(token: cart_token)
  end
  helper_method :current_cart


  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def cart_token
    return @cart_token unless @cart_token.nil?

    session[:cart_token] ||= SecureRandom.hex(8)
    @cart_token = session[:cart_token]
  end
end
