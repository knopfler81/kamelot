class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.we_are_sorry.subject
  #
  def we_are_sorry(order)
    @order = order

    mail( to: @order.user.email, subject: "Nous ne pouvons pas satisfaire votre demande")
  end

  def order_sent(order)
    @order = order

    mail( to: @order.user.email, subject: "Nous avons expédié votre commande")
  end
end
