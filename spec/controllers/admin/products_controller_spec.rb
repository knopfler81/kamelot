require 'rails_helper'

RSpec.describe Admin::ProductsController, :admin do

  before(:each) do 
    @user = FactoryBot.create(:user, admin: true, first_name: "Nelly")
    sign_in @user
    @category = create(:category)
    @product = create(:product, category_id: @category.id, sizes_attributes: [attributes_for(:size)])
  end

  describe "GET index" do
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

  describe "PATCH update" do 
    it "can change the title" do
     post :update, params: { id: @product.id, product: @product.attributes.merge(title: "Chemise verte")}
     expect(response).to redirect_to(admin_product_path(@product))
     expect(flash[:notice].present?).to be true
    end 
  end

  describe "POST create" do 
    it "create a product" do 
      product = build :product
      post :create, 
        params: {product: product.attributes.merge(
          user_id: @user.id, 
          ref: "REF", 
          brand: "Nike", 
          title: "Pull", 
          description: "une courte description", 
          category_id: @category.id, 
          sizes_attributes: [attributes_for(:size)], 
          color: "red", 
          price: 12 , 
          attachments: [
            File.open(File.join(Rails.root,"app/assets/images/seeds/pull_noir_1.jpg"))])}
      expect(response.status).to eq(200)
    end
  end
end