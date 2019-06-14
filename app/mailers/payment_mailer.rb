class PaymentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_mailer.confirmation.subject
  #
  def confirmation(order)
    @order = order
    attachments.inline["logo-cintre-mail.png"] = File.read("#{Rails.root}/app/assets/images/logo-cintre-mail.png")
    mail( to: @order.user.email, subject: "Confirmation de commande")
  end

  def new_order(order)
  	@order = order
  	mail(to: Company.instance.email, subject: "Nouvelle commande")
  end
end
