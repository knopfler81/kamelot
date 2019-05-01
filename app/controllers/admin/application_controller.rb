class Admin::ApplicationController < ActionController::Base

  layout "admin/application"

  before_action :current_basket
	before_action :favorites_products
  before_action :get_data_from_cookies
	
  def current_basket
    @current_basket ||= VendingBasket.new(token: basket_token)
  end

  helper_method :current_basket

  def favorites_products
  	@favorites = Favorite.where(user: current_user).all
  end

	private

  def get_data_from_cookies
    @hide_menu = cookies[:hide_menu] == 'true'
  end
	
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def basket_token
    return @basket_token unless @basket_token.nil?
    session[:basket_token] ||= SecureRandom.hex(8)
    @basket_token = session[:basket_token]
  end

end
