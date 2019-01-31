class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :products
  has_many :orders
  has_many :favorites, dependent: :destroy

  has_one :billing_address, dependent: :destroy
  has_one :shipping_address, dependent: :destroy

  validates :first_name,  presence: true, length: { minimum: 3}
  validates :last_name,   presence: true, length: { minimum: 3}
  validates :phone,       presence: true
  validates :email,       presence: true, uniqueness: true
  validates :birth_date,  presence: true

  validate :valide_birth_date

  def valide_birth_date
    if self.birth_date > Date.today
      errors.add(:birth_date, "ne peut pas être supérieure à la date d'aujourd'hui")
    end
  end


  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
