class Product < ApplicationRecord
	#audited

	mount_uploaders :attachments, AttachmentUploader


	belongs_to :user, optional: true
	belongs_to :category, optional: true

	has_many :favorites, dependent: :destroy
	has_many :favoriting_users, through: :favorites, source: :user

	
	has_many :variants, inverse_of: :product, dependent: :destroy
	has_many :stocks, through: :variants

	accepts_nested_attributes_for :variants
	
	validates :title,        presence: true
	validates :price,        presence: true
	validates :buying_price, presence: true
	validates :description,  presence: true
	validates :color,        presence: true
	validates :brand,        presence: true
	validates :category_id,  presence: true
	validates :ref, 				 presence: true

	validate  :attachment_size

	private

	def attachment_size
		if  self.attachments.count < 1
			errors.add(:base, :inferior_quota)
		elsif self.attachments.count > 4
			errors.add(:base, :exceeded_quota)
		end
	end
end