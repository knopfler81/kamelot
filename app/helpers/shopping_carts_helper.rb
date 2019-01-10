module ShoppingCartsHelper

  def current_cart
    @current_cart ||= ShoppingCart.new(token: cart_token)
  end

	private
	
	 def cart_token
	   return @cart_token unless @cart_token.nil?
	   session[:cart_token] ||= SecureRandom.hex(8)
	   @cart_token = session[:cart_token]
	 end

end