# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/we_are_sorry
  def we_are_sorry
  	order = Order.first
    OrderMailer.we_are_sorry(order)
  end


  def order_sent
		order = Order.first
	  OrderMailer.order_sent(order)
  end

  def cancel_order
		order = Order.first
	  OrderMailer.cancel_order(order)
  end

  def confirm_cancel_order
		order = Order.first
	  OrderMailer.confirm_cancel_order(order)
  end

end
