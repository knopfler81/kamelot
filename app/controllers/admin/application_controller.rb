class Admin::ApplicationController < ActionController::Base

  layout "admin/application"

	protect_from_forgery with: :exception

	before_action :current_cart
	before_action :favorites_products
	
  def current_cart
    @current_cart ||= ShoppingCart.new(token: cart_token)
  end
  helper_method :current_cart

  def current_product
  	@product = Product.find(params[:product_id])
  end

  def favorites_products
  	@favorites = Favorite.where(user: current_user).all
  end

	private
	
	 def cart_token
	   return @cart_token unless @cart_token.nil?
	   session[:cart_token] ||= SecureRandom.hex(8)
	   @cart_token = session[:cart_token]
	 end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

end
