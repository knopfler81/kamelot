class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.all
    # @products = Product.find(params[:product_id])
    #@categories = Category.joins(:products).select('categories.*, count(products.id) as products_count').group('categories.id').order(:title)
  end


  def show
    @category = Category.find(params[:id])
    @categories = Category.all
  end
end
