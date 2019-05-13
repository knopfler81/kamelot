class Admin::DashboardsController < Admin::ApplicationController

	def show
		@button 	||= set_button || :orders
		@dashboard 	= Dashboard.new((params[:search]))
		@variants 		||= @dashboard.variant_date_range
		@variants 			= @variants.order('created_at DESC')
	end

	def journal
		filter_products if params[:query].present?
		@dashboard 	= Dashboard.new((params[:search]))
		@variants 		||= @dashboard.variant_date_range
		@variants 		= @variants.order('created_at DESC')
	end

	private

	def dashboard_buttons_params
	  params.slice(:button)
	end

	def set_button
	  button = dashboard_buttons_params[:button]&.to_sym and [:products, :clients, :orders, :sales].include?(button) and button
	end

	def filter_products
	  return if params[:query].blank?
	  @variants = Variant.joins(:product).where('lower(products.title) LIKE ?', "%#{params[:query][:keyword].downcase }%")
	  .or(Variant.joins(:product).where('lower(products.description) LIKE ?', "%#{params[:query][:keyword].downcase }%"))
	  .or(Variant.joins(:product).where('lower(products.color) LIKE ?', "%#{params[:query][:keyword].downcase }%"))
		.or(Variant.joins(:product).where('lower(products.brand) LIKE ?', "%#{params[:query][:keyword].downcase }%"))
	end
end
