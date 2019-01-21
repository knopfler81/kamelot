# Preview all emails at http://localhost:3000/rails/mailers/payment_mailer
class PaymentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_mailer/confirmation
  def confirmation
  	order = Order.find(params[:id])
    PaymentMailerMailer.confirmation
  end

end
