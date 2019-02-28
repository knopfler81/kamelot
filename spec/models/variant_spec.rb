require 'rails_helper'

RSpec.describe Variant, type: :model do
   it { should validate_presence_of(:size) }  
end
