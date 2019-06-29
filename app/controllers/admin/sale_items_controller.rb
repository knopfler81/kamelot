class Admin::SaleItemsController < Admin::ApplicationController

  def index
    @items = current_basket.sale.items.order('created_at DESC')
    @sale = current_basket.sale
  end

  def create
    @item = current_basket
    @variant = Variant.find(params[:variant_id])

    @stock = @variant.stocks.map(&:quantity).sum 

    if @stock >= params[:quantity].to_i

      current_basket.add_item(
        quantity: params[:quantity],
        variant_id: params[:variant_id],
      )
      redirect_to admin_basket_path, notice: "Correctement ajouté au panier"
    else
      redirect_to admin_product_path(Product.find(variant.product.id))
    end
  end

  def edit
    @item = SaleItem.find(params[:id])
  end

  def update
    @variant = Variant.find(params[:variant_id])
    @stock = @variant.stocks.map(&:quantity).sum 
    respond_to do |format|
      if @stock >= params[:quantity].to_i
        @item = current_basket
        @item.change_qty( 
          id: params[:id],
          quantity: params[:quantity],
          variant_id: params[:variant_id]
        )
        format.js  
        format.html { redirect_to admin_basket_path, notice: "Quantité modifiée" }
      else
        format.js
        format.html { redirect_to admin_product_path(Product.find(variant.product.id)), alert: "oh oh"}
      end
    end
  end

  def destroy
    @current_basket.remove_item(id: params[:id])
    respond_to do |format|
      format.js 
      format.html { redirect_to admin_cash_path, notice: "Correctement supprimé du panier" }
    end   
  end

  private 


  def sale_item_params
    params.require(:sale_item).permit(:id, :quantity, :user_id, :variant_id, :sale_id)
  end
end
