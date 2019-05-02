class Clients::PaymentsController < Clients::ApplicationController

	before_action :set_order

	def create
	  customer = Stripe::Customer.create(
	    source: params[:stripeToken],
	    email:  params[:stripeEmail]
	  )

	  # charge = Stripe::Charge.create(
	  #   customer:     customer.id,
	  #   amount:       @order.total_cents,
	  #   description:  "Commande #{@order.id} - #{@order.user.full_name}",
	  #   currency:     @order.total.currency,

	  # )
	  # @order.update_attributes!(payment: charge.to_json, status: 'paid')

	  ## Dans le cas où on veut encaisser plus tard
	  ## Create charge without debit on account
	  charge = Stripe::Charge.create(
	    customer:     customer.id,
	    amount:       @order.total_cents,
	    description:  "#{@order.number} - #{@order.user.full_name}",
	    currency:     @order.total.currency,
	    capture: false
	  )
	  ## Keep charge.id
	  # Debit charge
	   charge = Stripe::Charge.retrieve(charge.id)
	  # charge.capture
	   @order.update_attributes!(payment: charge.to_json, charge_id: charge.id, status: 'pending')

	  if @order.save
		  @order.remove_from_stock
		  session[:cart_token] == nil

		  PaymentMailer.confirmation(@order).deliver_now
		  PaymentMailer.new_order(@order).deliver_now

		  if FeatureSwitch.enabled?(:send_sms)
		  	twilio.send_sms(@order)
			end

			redirect_to clients_orders_path
	  end

		rescue Stripe::CardError => e
		  flash[:alert] = e.message
	end
	
	private

	def twilio
		TwilioClient.new
	end

	def find_paid_order
		@order = Order.where(status: 'paid', user_id: @order.user.id).find(params[:order_id])

	end

  def set_order
    @order = Order.where(status: 'ongoing', token: session[:cart_token]).find(params[:order_id])
  end
end