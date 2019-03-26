class RemoveOldStickersJob < ApplicationJob

	queue_as :default

	def perform(*args)
	  stickers = Sticker.where('created_at <=?', 1.week.ago)
		stickers.destroy_all
	end

end