class Product < ApplicationRecord
	belongs_to :user
	has_many :product_categories
	has_many :categories, through: :product_categories
	validates :title,       presence: true
	validates :price,       presence: true
	validates :description, presence: true
	validates :quantity,    presence: true
	validates :size,        presence: true
	validates :color,       presence: true
end
