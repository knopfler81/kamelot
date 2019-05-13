require 'rails_helper'

RSpec.describe Admin::CustomizationController, :clients do


	describe "GET show" do
	  it "renders the show template" do
	  	sign_in FactoryBot.create(:user, admin: true)
	    get :show
	    expect(response).to render_template("show")
	    expect(response.status).to eq(200)
	  end
	end
end