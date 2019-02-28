class Stock < ApplicationRecord
  belongs_to :variant


  before_validation :to_initial_quantity, on: :create

  private

  def to_initial_quantity
  	self.initial_quantity = self.quantity
  end
end
