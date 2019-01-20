class Product < ApplicationRecord

	mount_uploaders :attachments, AttachmentUploader

	belongs_to :user, optional: true
	belongs_to :category, optional: true

	has_many :favorites, dependent: :destroy
	has_many :favoriting_users, through: :favorites, source: :user
	has_many :sizes, inverse_of: :product, dependent: :destroy
	accepts_nested_attributes_for :sizes, reject_if: :all_blank, allow_destroy: true
	
	
	validates :title,       presence: true
	validates :price_cents, presence: true
	validates :description, presence: true
	validates :color,       presence: true
	validates :brand,       presence: true
	validates :category_id, presence: true

end
