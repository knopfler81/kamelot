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

  def cancel_order(order)
    @order = order
    mail(to: Company.instance.email, subject: "Commande annulée")
  end

  def confirm_cancel_order(order)
    @order = order

    mail( to: @order.user.email, subject: "Nous avons bien annulé votre commande")
  end
end
