class Admin::CategoriesController < Admin::ApplicationController

  def index
    @categories = Category.all
  end


  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @cat_products = @category.products.paginate(page: params[:page], per_page: 8) 
  end
end
