# Preview all emails at http://localhost:3000/rails/mailers/payment_mailer
class PaymentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_mailer/confirmation
  def confirmation
  	order = Order.first
    PaymentMailer.confirmation(order)
  end

  def new_order
		order = Order.first
	  PaymentMailer.new_order(order)
  end

end
