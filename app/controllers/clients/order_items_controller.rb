class Clients::OrderItemsController < ApplicationController
  include ShoppingCartsHelper

  def index
    @items = current_cart.order.items
  end

  def create
    @size = Size.find(params[:size_id])

    if @size.quantity >= params[:quantity].to_i
      current_cart.add_item(
        product_id: params[:product_id],
        quantity: params[:quantity],
        user_id: params[:user_id],
        size_id: params[:size_id])

      redirect_to clients_cart_path, notice: "Correctement ajouté au panier"
    else
      redirect_to clients_product_path(Product.find(params[:product_id]))
      flash[:alert] = "Il y a plus que #{@size.quantity} articles en stock"
    end

  end

  def destroy
    current_cart.re_add_stock(id: params[:id])

    current_cart.remove_item(id: params[:id])

    redirect_to clients_cart_path, notice: "Correctement supprimé du panier"
  end
end
