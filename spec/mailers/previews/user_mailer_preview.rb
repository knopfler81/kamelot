# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/we_are_sorry
  def welcome
  	user = User.first
    UserMailer.welcome(user)
  end

end