require 'rails_helper'

RSpec.describe Clients::BillingAddressesController, :clients do

  before(:each) do 
    @order = create(:order)
    @user  = FactoryBot.create(:user, admin: false)
    sign_in @user
  end

  describe "PATCH UPDATE" do 
    it "can update a billing_address" do
      @billing_address = create(:billing_address, user_id: @user.id)

      patch :update,  params: { id: @billing_address.id, billing_address: @billing_address.attributes.merge(street_number: 9)}
      
      expect(response).to redirect_to(clients_user_path(@user))
      expect(flash[:notice].present?).to be true
    end
  end

  describe "POST create" do 

    it "create a billing_address" do 
      post :create, params: { billing_address: attributes_for(:billing_address)}
      expect(flash[:notice].present?).to be true
    end
  end
end
