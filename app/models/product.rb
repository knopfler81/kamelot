class Product < ApplicationRecord

	belongs_to :user
	belongs_to :category

	validates :title,       presence: true
	validates :price,       presence: true
	validates :description, presence: true
	validates :quantity,    presence: true
	validates :size,        presence: true
	validates :color,       presence: true
end
