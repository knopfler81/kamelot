require 'rails_helper'

RSpec.describe Clients::ProductsController, :clients do

  before(:each) do 
    sign_in FactoryBot.create(:user, admin: true)
    category = create(:category)
    @product = create(:product, category_id: category.id)
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
end