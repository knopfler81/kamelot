class Product < ApplicationRecord

	mount_uploaders :attachments, AttachmentUploader

	belongs_to :user, optional: true
	belongs_to :category, optional: true


	has_many :favorites, dependent: :destroy
	has_many :favoriting_users, through: :favorites, source: :user

	has_many :variants, dependent: :destroy
	has_many :stocks,   through: :variants
	has_many :stickers

	belongs_to :supplier

	accepts_nested_attributes_for :variants
	
	validates :title,        presence: true
	validates :price,        presence: true
	validates :buying_price, presence: true
	validates :description,  presence: true
	validates :color,        presence: true
	validates :brand,        presence: true
	validates :category_id,  presence: true
	validates :ref, 				 presence: true
	validates :weight,       presence: true

	validate  :attachment_size

	def with_stock?
		self.stocks.map(&:quantity).sum >= 1  ? true : false
	end


	private

	def attachment_size
		if  self.attachments.count > 4
			errors.add(:base, :exceeded_quota)
		end
	end
end