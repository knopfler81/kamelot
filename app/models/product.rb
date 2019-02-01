class Product < ApplicationRecord

	mount_uploaders :attachments, AttachmentUploader

	belongs_to :user, optional: true
	belongs_to :category, optional: true

	has_many :favorites, dependent: :destroy
	has_many :favoriting_users, through: :favorites, source: :user
	has_many :sizes, inverse_of: :product, dependent: :destroy
	has_many :order_items, dependent: :destroy

	accepts_nested_attributes_for :sizes, reject_if: :all_blank, allow_destroy: true
	
	validates :title,       presence: true
	validates :price_cents, presence: true
	validates :description, presence: true
	validates :color,       presence: true
	validates :brand,       presence: true
	validates :category_id, presence: true
	validates :ref, 				presence: true
	validates :attachments, presence: true

	validate  :attachment_size
	validate  :at_least_one_size


	private
	
	def attachment_size
		if  self.attachments.count < 1
			errors.add(:base, :inferior_quota)
		elsif self.attachments.count > 4
			errors.add(:base, :exceeded_quota)
		end
	end


	def at_least_one_size
		if self.sizes.empty?
			errors.add(:base, :require_size)
		end
	end
end