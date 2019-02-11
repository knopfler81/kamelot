require 'rails_helper'

RSpec.describe Admin::ProductsController, :admin do

  before(:each) do 
    sign_in FactoryBot.create(:user, admin: true)
    #size = build(:size)
    category = create(:category)
    @product = create(:product, category_id: category.id, sizes_attributes: [attributes_for(:size)])
  end

  describe "GET index" do
    it "assigns @products" do
      get :index
      expect(assigns(:products)).to eq([@product])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
      #expect(response.status).to eq(200)
    end
  end

  describe "GET show" do 
    it "doesn't raise an error" do 

      get :show, params: { id: @product.id }
      expect(response).to render_template("show")
    end
  end

  describe "DELETE destroy" do 
    it "can destroy a product" do
      delete :destroy,  params: { id: @product.id }
      expect(response).to redirect_to(admin_products_path)
      expect(flash[:notice].present?).to be true
    end
  end
end