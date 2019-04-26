class Company < ApplicationRecord
	
	INSTANCE_ID =  1

	def self.instance
		company = Company.find_or_create_by(id: INSTANCE_ID)
	end
end
