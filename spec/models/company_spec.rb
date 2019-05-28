require 'rails_helper'

RSpec.describe Company, type: :model do
	it { should validate_presence_of(:admin_name)}
	it { should validate_presence_of(:address_1)}
	it { should validate_presence_of(:city)}
	it { should validate_presence_of(:zipcode)}
	it { should validate_presence_of(:country)}
	it { should validate_presence_of(:phone)}
	it { should validate_presence_of(:email)}
	it { should validate_presence_of(:site_name)}
end
