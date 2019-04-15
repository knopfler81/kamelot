class Clients::ContactsController < Clients::ApplicationController
	
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request
    if verify_recaptcha(model: @contact)
      if @contact.deliver
        flash.now[:notice] = "Votre email a bien été envoyé"
        redirect_to root_path
      else
        flash.now[:error] = "Oups l'email n'a pas été envoyé, veuillez recommencer"
        render :new
      end
    end
  end

  private
  def contact_params
  	params.require(:contact).permit(:email, :full_name, :message_content)
  end
end
