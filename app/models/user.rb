class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :products
  has_many :orders
  has_many :sales #only admin
  has_many :favorites, dependent: :destroy

  has_one :billing_address, dependent: :destroy
  has_one :shipping_address, dependent: :destroy

  validates :first_name,  presence: true, length: { minimum: 2}
  validates :last_name,   presence: true, length: { minimum: 2}
  validates :email,       presence: true, uniqueness: true
  validates :birth_date,  format: { with: /\A([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$\z/}, allow_blank: true

  validate :email_matching


  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def email_matching
    if self.email != self.email_confirmation
      errors.add(:base, :email_must_match)
    end
  end

end
