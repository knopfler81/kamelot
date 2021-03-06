class Product < ApplicationRecord


	SIZE_NAMES = %w[XS S M L XL XXL XXXL] 
	SIZE_NUMS  = %w[26 27 28 29 30 31 32 33 34 36 38 40 42 42 43 44 45 46 47 48 49 50 28/32 29/32 30/33 31/33 32/33 33/33 34/33 36/34 38/34]

	mount_uploaders :attachments, AttachmentUploader
	extend FriendlyId
	friendly_id :slug_title_brand_id, use: :slugged

	belongs_to :user, optional: true
	belongs_to :category, optional: true
	belongs_to :supplier

	has_many :favorites, dependent: :destroy
	has_many :favoriting_users, through: :favorites, source: :user
	has_many :variants, dependent: :destroy
	has_many :stocks,   through: :variants
	has_many :stickers

	before_save :set_discount
	before_save :upcase_ref

	accepts_nested_attributes_for :variants
	
	validates :title,        presence: true
	validates :market_price, presence: true
	validates :price,        presence: true
	validates :buying_price, presence: true
	validates :description,  presence: true
	validates :color,        presence: true
	validates :brand,        presence: true
	validates :category_id,  presence: true
	validates :ref, 				 presence: true
	validates :weight, 			 presence: true
	
	validate  :attachment_size


	def upcase_ref
		self.ref.upcase
	end

	def slug_title_brand_id 
		"#{self.title}- #{self.brand}-#{self.color}"
	end

	def with_stock?
		self.stocks.map(&:quantity).sum >= 1  ? true : false
	end


	def set_discount
		self.discounted_price = price - (price * discount_percentage / 100)
		if self.discount_percentage > 0
			if self.stocks.any?
				self.stocks.each do |stock|
			  	stock.discount = stock.price - (stock.price * stock.variant.product.discount_percentage / 100)
			  	stock.save!
			  end
			end
	  end
	end

	def variant_types
		if SIZE_NUMS.include?(self.variants.first.size)
			self.variants.sort_by { |variant| SIZE_NUMS.index(variant.size) }
		elsif SIZE_NAMES.include?(self.variants.first.size)
		  self.variants.sort_by { |variant| SIZE_NAMES.index(variant.size) }
		end
	end



	private

	def attachment_size
		if  self.attachments.count > 8
			errors.add(:base, :exceeded_quota)
		end
	end
end