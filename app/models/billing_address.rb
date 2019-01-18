class BillingAddress < ApplicationRecord

	belongs_to :user
	#belongs_to :order #a voir??
end
