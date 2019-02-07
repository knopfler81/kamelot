# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/we_are_sorry
  def we_are_sorry
    OrderMailer.we_are_sorry
  end

end
