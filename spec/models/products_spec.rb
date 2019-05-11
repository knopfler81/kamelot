require 'rails_helper'

 RSpec.describe Product, type: :model do

 	it { should validate_presence_of(:title) }
 	it { should validate_presence_of(:price) }
 	it { should validate_presence_of(:buying_price) }
 	it { should validate_presence_of(:description) }
 	it { should validate_presence_of(:color) }
 	it { should validate_presence_of(:weight) }
 	it { should validate_presence_of(:brand) }
 	it { should validate_presence_of(:category_id) }
end
