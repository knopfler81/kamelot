class Product < ApplicationRecord

	mount_uploaders :attachments, AttachmentUploader

	belongs_to :user
	belongs_to :category

	has_many :sizes, inverse_of: :product, dependent: :destroy
	
	accepts_nested_attributes_for :sizes, reject_if: :all_blank, allow_destroy: true
	
	validates :title,       presence: true
	validates :price,       presence: true
	validates :description, presence: true
	validates :color,       presence: true


	# validate :attachments_size



	#  private
	#   def attachments_size
	#     size_array = self.attachments.collect { |e| e.size }
	#     if size_array.inject(0, :+) >  5.megabytes
	#       errors.add(:attachments, "should be less than 5MB")
	#     end
	#   end


end
