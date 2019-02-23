class Customization < ApplicationRecord

	mount_uploader :main_image, MainImageUploader

	INSTANCE_ID =  66

	def self.instance
		Customization.find_or_create_by(id: INSTANCE_ID)
	end
end
