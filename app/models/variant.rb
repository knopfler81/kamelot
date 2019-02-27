class Variant < ApplicationRecord
  belongs_to :product
  #belongs_to :product, class_name: 'Product', inverse_of: :variants

  has_many   :stocks
end
