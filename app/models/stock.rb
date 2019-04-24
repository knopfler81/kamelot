class Stock < ApplicationRecord
  belongs_to :variant
  belongs_to :supplier

  before_validation :to_initial_quantity, on: :create

  def define_supplier
  	if self.supplier.company != self.variant.product.supplier.company
 			self.supplier.company
 		else
 			self.variant.product.supplier.company
 		end
  end

  def set_discount
    self.price - ( self.price * (self.variant.product.discount_percentage / 100))
  end

  private

  def to_initial_quantity
  	self.initial_quantity = self.quantity
  end

end
