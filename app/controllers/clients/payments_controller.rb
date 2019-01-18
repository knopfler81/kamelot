class Clients::PaymentsController < ApplicationController

	before_action :set_order

	def create
	  customer = Stripe::Customer.create(
	    source: params[:stripeToken],
	    email:  params[:stripeEmail]
	  )

	  charge = Stripe::Charge.create(
	    customer:     customer.id,   # You should store this customer id and re-use it.
	    amount:       @order.sub_total_cents,
	    description:  "Paiment pour la commande #{@order.id}",
	    currency:     @order.sub_total.currency
	  )

	  @order.update(payment: charge.to_json, status: 'paid')
	  redirect_to clients_orders_path

	  @order.remove_from_stock

	  session[:cart_token] == nil


	rescue Stripe::CardError => e
	  flash[:alert] = e.message
	end
	private

	  def set_order
	    @order = current_user.orders.where(status: 'pending').find(params[:order_id])
	  end
end
