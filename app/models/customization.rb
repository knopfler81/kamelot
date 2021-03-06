class Customization < ApplicationRecord

	mount_uploader :main_image,   MainImageUploader
	mount_uploader :second_image, SecondImageUploader
	mount_uploader :third_image,  ThirdImageUploader
	mount_uploader :logo,         LogoUploader
	mount_uploader :logo_banner,  LogoBannerUploader

	INSTANCE_ID =  66

	def self.instance
		Customization.find_or_create_by(id: INSTANCE_ID)
	end
end
