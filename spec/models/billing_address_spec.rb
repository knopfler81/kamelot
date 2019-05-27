require 'rails_helper'

RSpec.describe BillingAddress, type: :model do
	it { should validate_presence_of(:address_1) }
	it { should validate_presence_of(:city) }
	it { should validate_presence_of(:zipcode) }
	it { should validate_presence_of(:country) }


	describe "#full_name" do 
		it "return the user's full name" do
			user    = create(:user)
			billing = create(:billing_address, first_name: "Lili", last_name: "Lewis", user_id: user.id)

			res = billing.full_name

			expect(res).to eq 'Lili Lewis'
		end
	end
end
