class Admin::AttachmentsController < Admin::ApplicationController
  protect_from_forgery

  before_action :set_product

  def create
    add_more_attachments(attachments_params[:attachments])
    if @product.save
      redirect_to edit_admin_product_path(@product), notice: "Successfully added"
    else
      flash[:alert] = "NOOOOOOO WAYYY"
    end
  end

  def destroy
    remove_attachments_at_index(params[:id].to_i)
    if @product.save
      
      redirect_to edit_admin_product_path(@product), notice: "Picture was successfully destroyed"
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def add_more_attachments(new_attachments)
    attachments = @product.attachments 
    attachments += new_attachments
    @product.attachments = attachments
  end

  def remove_attachments_at_index(index)
    remain_attachments = @product.attachments
    if index == 0 && @product.attachments.size == 1
      @product.remove_attachments!
    end
    deleted_attachments = remain_attachments.delete_at(index)
    deleted_attachments.try(:remove!)
    @product.attachments = remain_attachments
  end

  def attachments_params
    params.require(:product).permit({attachments: []})
  end
end