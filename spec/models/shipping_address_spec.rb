require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
	it { should validate_presence_of(:address_1) }
	it { should validate_presence_of(:city) }
	it { should validate_presence_of(:zipcode) }
end