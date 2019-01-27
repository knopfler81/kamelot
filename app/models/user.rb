class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :orders
  has_many :favorites, dependent: :destroy

  has_one  :billing_address, dependent: :destroy

  validates :first_name,  presence: true, length: { minimum: 3}
  validates :last_name,   presence: true, length: { minimum: 3}
  validates :address_1,   presence: true 
  validates :country,     presence: true
  validates :zipcode,     presence: true
  validates :city,        presence: true
  validates :phone,       presence: true, length: { minimum: 10, maximum: 10 }
  validates :email,       presence: true, uniqueness: true
  validates :birth_date,  presence: true
end
