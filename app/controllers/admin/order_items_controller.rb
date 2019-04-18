class Admin::OrderItemsController < Admin::ApplicationController

  def index
    @order = Order.find(params[:order_id])
    @items = @order.items.order('created_at ASC')
  end

  def update
    @order = Order.find(params[:order_id])
    @item = OrderItem.find(params[:id])
    respond_to do |format|
      if @item.update_attributes(order_item_params)
        format.js
        format.html {redirect_to admin_order_order_items_path(@order)}
      else
        format.js
        format.html {redirect_to admin_order_order_items_path(@order)}
      end
    end
  end

  private 

  def order_item_params
    params.permit(:id, :quantity, :user_id, :variant_id, :order_id, :selected, :price, :missing_quantity)
  end
end
