class TwilioClient
	def send_sms(order)
  	client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    client.messages.create({
      from: ENV["TWILIO_PHONE_NUMBER"],
      to:   ENV["MY_PERSONAL_PHONE_NUMBER"],  
      body: text_message_for(order)
    })
	end

	def text_message_for(order)
		text = "Nouvelle commande:  #{order.number} \n\n" 

		text << "#{order.user.full_name}\n\n" 
		  	
		order.items.each do |item|
			text << "Quantité: #{item.quantity} \n"
			text << "Ref: #{item.variant.product.title} \n"
			text << "Couleur: #{item.variant.product.color} \n"
			text << "Marque: #{item.variant.product.brand} \n"
			text << "Taille: #{item.variant.size} \n"
			text << "URL: https://lapenderiedelhomme.fr/clients/products/#{item.variant.product.slug} \n"
			text << "---------------\n\n"
		end

		text
	end
end