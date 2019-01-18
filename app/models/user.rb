class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :orders

  has_one :billing_address, dependent: :destroy


  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :favorites, dependent: :destroy


  # def completed_profile?
  # 	if address_1.present? && zipcode.present? && city.present? && phone.present?
  # 		true
  # 	else
  # 		false
  # 	end
  # end
end
