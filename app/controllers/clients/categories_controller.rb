class Clients::CategoriesController < ApplicationController

    def index
      @categories = Category.all
    end

    def show
      @category = Category.find(params[:id])
      @categories = Category.all
    end

end