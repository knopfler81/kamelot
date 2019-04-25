class Clients::CategoriesController < Clients::ApplicationController
	
  def index
    @categories = Category.all
  end

  def show
    @category = Category.friendly.find(params[:id])
    @categories = Category.all
    @client_cat_products = @category.products.paginate(page: params[:page], per_page: 12).order('created_at DESC')
  end

end