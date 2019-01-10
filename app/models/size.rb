class Size < ApplicationRecord
	belongs_to :product
	belongs_to :category

	validates :quantity,  presence: true
	validates :size_name, presence: true

 	scope :sort_by_category, ->  { joins(product: :category).order("categories.title ASC,  products.title ASC, sizes.created_at ASC ")}

end
