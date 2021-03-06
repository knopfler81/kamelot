class OrderMailer < ApplicationMailer

  def we_are_sorry(order)
    @order = order
    attachments.inline["logo-cintre-mail.png"] = File.read("#{Rails.root}/app/assets/images/logo-cintre-mail.png")
    mail( to: @order.user.email, subject: "Nous ne pouvons pas satisfaire votre demande")
  end

  def order_sent(order)
    @order = order
    attachments.inline["logo-cintre-mail.png"] = File.read("#{Rails.root}/app/assets/images/logo-cintre-mail.png")
    mail( to: @order.user.email, subject: "Nous avons expédié votre commande")
  end

  def cancel_order(order)
    @order = order
    mail(to: Company.instance.email, subject: "Commande annulée")
  end

  def confirm_cancel_order(order)
    @order = order
    attachments.inline["logo-cintre-mail.png"] = File.read("#{Rails.root}/app/assets/images/logo-cintre-mail.png")
    mail( to: @order.user.email, subject: "Nous avons bien annulé votre commande")
  end
end
