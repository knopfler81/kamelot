class Clients::OrderItemsController < Clients::ApplicationController

  def index
    @items = current_cart.order.items.order('created_at DESC')
  end

  def create
    @item = current_cart
    @variant = Variant.find(params[:variant_id])

    @stock = @variant.stocks.map(&:quantity).sum 

    if @stock >= params[:quantity].to_i

      current_cart.add_item(
        quantity: params[:quantity],
        variant_id: params[:variant_id],
      )

      redirect_to clients_cart_path, notice: "Correctement ajouté au panier"
    else
      redirect_to clients_product_path(Product.find(variant.product.id))
      flash[:alert] = "Il y a plus que #{@variant.quantity} articles en stock"
    end
  end

  def edit
    @item = OrderItem.find(params[:id])
  end

  def update
    @variant = Variant.find(params[:variant_id])
    respond_to do |format|
    @stock = @variant.stocks.map(&:quantity).sum 

    if @stock >= params[:quantity].to_i
        @item = current_cart
        @item.change_qty( 
          id: params[:id],
          quantity: params[:quantity],
          variant_id: params[:variant_id]
        )
        format.js
        format.html { redirect_to clients_cart_path, notice: "Quantité modifiée" }
      else
        format.js { flash.now[:notice] = "Il y a plus que #{@variant.quantity} articles en stock" }
        format.html { redirect_to clients_product_path(Product.find(variant.product.id)), alert: "oh oh"}
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
    params.require(:order_item).permit(:id, :quantity, :user_id, :variant_id, :order_id)
  end
end
