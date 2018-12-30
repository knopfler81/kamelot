class Product < ApplicationRecord
	belongs_to :user
	belongs_to :category

	has_many :sizes, inverse_of: :product, dependent: :destroy
	accepts_nested_attributes_for :sizes, reject_if: :all_blank, allow_destroy: true
	
	validates :title,       presence: true
	validates :price,       presence: true
	validates :description, presence: true
	validates :color,       presence: true

end
