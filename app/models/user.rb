class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products



  def completed_profile?
  	if first_name.present? && last_name.present? && address_1.present? && zipcode.present? && city.present? && phone.present?
  		true
  	else
  		false
  	end
  end
end
