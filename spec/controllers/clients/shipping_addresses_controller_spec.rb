require 'rails_helper'

RSpec.describe Clients::ShippingAddressesController, :clients do

  before(:each) do 
    @order = create(:order)
    @user  = FactoryBot.create(:user, admin: false)
    sign_in @user
  end

  describe "PATCH UPDATE" do 
    it "can update a shipping_address" do
      @shipping_address = create(:shipping_address, user_id: @user.id)

      patch :update,  params: { id: @shipping_address.id, shipping_address: @shipping_address.attributes.merge(street_number: 9)}
      
      expect(response).to redirect_to(clients_user_path(@user))
      expect(flash[:notice].present?).to be true
    end
  end

  describe "POST create" do 

    it "create a shipping_address" do 
      post :create, params: { shipping_address: attributes_for(:shipping_address, user_id: @user.id)}
      expect(flash[:notice].present?).to be true
    end
  end
end