
require 'rails_helper'

RSpec.describe "Dashboards" do 

	before(:each) do
		nelly   = create :user, admin: true 
		login_as nelly
	end

	context "Admin visits Orders dashboards" do 

		it "display the number total of orders", js: true do 

			#ajouter les dates de recherche
			
			@dashboard = Dashboard.new
			create(:order, status: "full_shipped", created_at: 1.day.ago)
			create(:order, status: "full_shipped", created_at: 1.day.ago)
			create(:order, status: "full_shipped", created_at: 1.day.ago)
			visit admin_dashboard_path(@dashboard)

			save_and_open_page

			find("#orders_click").click
			expect(page).to have_content(Commandes sur le site - [3])
		end
	end 

end