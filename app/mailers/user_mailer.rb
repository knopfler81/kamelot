class UserMailer < ApplicationMailer

  def welcome(user)
    @user = user
    attachments.inline["logo-cintre-mail.png"] = File.read("#{Rails.root}/app/assets/images/logo-cintre-mail.png")

    mail( to: @user.email, subject: "Bienvenue!")
  end
end
