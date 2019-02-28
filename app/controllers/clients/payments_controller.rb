class Clients::PaymentsController < Clients::ApplicationController

	before_action :set_order

	def create
	  customer = Stripe::Customer.create(
	    source: params[:stripeToken],
	    email:  params[:stripeEmail]
	  )

	  charge = Stripe::Charge.create(
	    customer:     customer.id,   # You should store this customer id and re-use it.
	    amount:       @order.total_cents,
	    description:  "Paiment pour la commande #{@order.id}",
	    currency:     @order.total.currency
	  )

	  @order.update_attributes!(payment: charge.to_json, status: 'paid')

	  if @order.save
		  @order.remove_from_stock
		  session[:cart_token] == nil
		  PaymentMailer.confirmation(@order).deliver_now
		  PaymentMailer.new_order(@order).deliver_now

		 text_message = "Nouvelle commande  ref: #{@order.id} \n\n" 

			@order.items.each do |item|
  			text_message << "Quantité: #{item.quantity} \n"
  			text_message << "Ref: #{item.variant.product.title} \n"
  			text_message << "Marque: #{item.variant.product.brand} \n"
  			text_message << "Taille: #{item.variant.size} \n"
  			text_message << "---------------\n\n"
  		end

		  #send_message(text_message) à réactiver pour l'envoi de sms

			redirect_to clients_orders_path
	  end

	rescue Stripe::CardError => e
	  flash[:alert] = e.message
	end
	
	private

	def find_paid_order
		@order = Order.where(status: 'paid', user_id: @order.user.id).find(params[:order_id])

	end

  def set_order
    @order = Order.where(status: 'pending', token: session[:cart_token]).find(params[:order_id])
  end

  def send_message(text_message)
    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    client.messages.create({
      from: ENV["TWILIO_PHONE_NUMBER"],
      to: 	ENV["MY_PERSONAL_PHONE_NUMBER"],  
      body: text_message
    })

  end
end
