class Clients::ContactsController < Clients::ApplicationController
	
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request
    if verify_recaptcha(model: @contact)
      if @contact.deliver
        redirect_to root_path, notice: "Votre email a bien été envoyé"
      else
        render :new, alert: "Oups l'email n'a pas été envoyé, veuillez recommencer"
      end
    end
  end

  private
  def contact_params
  	params.require(:contact).permit(:email, :full_name, :message_content)
  end
end
