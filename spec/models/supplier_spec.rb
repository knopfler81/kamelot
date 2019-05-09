require 'rails_helper'

 RSpec.describe Supplier, type: :model do
 	it { should validate_presence_of(:company) }
 	it { should validate_presence_of(:address) }
 	it { should validate_presence_of(:zipcode) }
 	it { should validate_presence_of(:city) }
 	it { should validate_presence_of(:zipcode) }
 end