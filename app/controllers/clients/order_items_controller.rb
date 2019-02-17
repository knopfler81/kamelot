class Clients::OrderItemsController < Clients::ApplicationController

  def index
    @items = current_cart.order.items.order('created_at DESC')
  end

  def create
    @item = current_cart
    @size = Size.find(params[:size_id])

    if @size.quantity >= params[:quantity].to_i

      current_cart.add_item(
        quantity: params[:quantity],
        size_id: params[:size_id],
      )

      redirect_to clients_cart_path, notice: "Correctement ajouté au panier"
    else
      redirect_to clients_product_path(Product.find(size.product.id))
      flash[:alert] = "Il y a plus que #{@size.quantity} articles en stock"
    end
  end

  def edit
    @item = OrderItem.find(params[:id])
  end

  def update
    @size = Size.find(params[:size_id])
    respond_to do |format|
      if @size.quantity >= params[:quantity].to_i
        @item = current_cart
        @item.change_qty( 
          id: params[:id],
          quantity: params[:quantity],
          size_id: params[:size_id]
        )
        format.js
        format.html { redirect_to clients_cart_path, notice: "Quantité modifiée" }
      else
        format.js { flash.now[:notice] = "Il y a plus que #{@size.quantity} articles en stock" }
        format.html { redirect_to clients_product_path(Product.find(size.product.id)), alert: "oh oh"}
      end
    end
  end

  def destroy
    @current_cart.remove_item(id: params[:id])
    respond_to do |format|
      format.js 
      format.html { redirect_to clients_cart_path, notice: "Correctement supprimé du panier" }
    end   
  end

  private 


  def order_item_params
    params.require(:order_item).permit(:id, :quantity, :user_id, :size_id, :order_id)
  end
end
