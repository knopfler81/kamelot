class Category < ApplicationRecord
	has_many :products
	has_many :sizes, through: :products

	validates :title, presence: true, uniqueness: true
end
