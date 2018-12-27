class OrderItemsController < ApplicationController

  def index
    @items = current_cart.order.items
    #@total = OrderItem.all.map {|o_i| o_i.price}.sum
  end

  def create
    current_cart.add_item(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: params[:user_id],
      size_id: params[:size_id]
    )

    redirect_to cart_path, notice: "Correctement ajouté au panier"
  end

  def destroy

    current_cart.re_add_stock(id: params[:id])

    current_cart.remove_item(id: params[:id])

    redirect_to cart_path, alert: "Correctement supprimé du panier"
  end
end
