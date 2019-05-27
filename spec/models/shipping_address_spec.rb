require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do

	it { should validate_presence_of(:address_1) }
	it { should validate_presence_of(:city) }
	it { is_expected.to allow_value("42000").for(:zipcode) }
	it { is_expected.to allow_value("0600112233").for(:phone) }
	it { is_expected.to allow_value("FR").for(:country) }
	it { is_expected.not_to allow_value("4200").for(:zipcode) }
	it { is_expected.not_to allow_value("060012233").for(:phone) }

 	describe "#valid_country" do 
 		it "validates the country" do 
	  	subject { ShippingAddress.new(country: "FR") }
 			expect(subject.valid_country).to be_truthy
 		end

 		it "does not validate the country" do 
 			subject { ShippingAddress.new(country: "ES") }
 			expect(subject.valid_country).to eq(["Nous sommes désolés, mais livrons uniquement en France métropolitaine pour le moment"])
 		end
 	end

end
