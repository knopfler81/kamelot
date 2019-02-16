require 'rails_helper'

RSpec.describe Admin::OrdersController, :admin do

  before(:each) do 
    sign_in FactoryBot.create(:user)
    @order    = create(:order)
  end
  
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
      expect(response.status).to eq(200)
    end
  end

  describe "GET show" do 
    it "doesn't raise an error" do 

      get :show, params: { id: @order.id }
      expect(response).to render_template("show")
    end
  end
end