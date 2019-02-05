class PaymentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_mailer.confirmation.subject
  #
  def confirmation(order)
    @order = order
    mail( to: @order.user.email, subject: "Confirmation de commande")
  end

  def new_order(order)
  	@order = order
  	mail(to: ENV["ADMIN_EMAIL"], subject: "Nouvelle commande")
  end
end
