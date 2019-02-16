class OrderItem < ApplicationRecord
	belongs_to :order
	belongs_to :size

	scope :exclude_if_size_quantity_zero, ->  { joins(:size).where('sizes.quantity >?' ,0)}

	#after_initialize :double_check_if_exist

	validates :size_id, presence: true

	def double_check_if_exist
		if self.size.quantity == 0
			self.destroy
		end
	end
end