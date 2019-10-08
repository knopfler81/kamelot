class Clients::CategoriesController < Clients::ApplicationController
	
  def index
    @categories = Category.all
  end

  def show
    @category = Category.friendly.find(params[:id])
    @categories = Category.all
    @client_cat_products  = @category.products.left_joins(variants: :stocks) 
      .group(:id)
      .select(Product.arel_table[Arel.star],
              Stock.arel_table[:quantity].sum.as('total_quantity'))
      .order('total_quantity ASC').paginate(page: params[:page], per_page: 12)
  end

end