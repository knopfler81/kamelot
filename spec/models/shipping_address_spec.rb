require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
	it { should validate_presence_of(:route) }
	it { should validate_presence_of(:locality) }
	it { should validate_presence_of(:postal_code) }
end
