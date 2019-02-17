class Admin::DashboardsController < Admin::ApplicationController

	def show
		@button 	||= set_button || :orders
		@dashboard 	= Dashboard.new((params[:search]))
		@sizes 		||= @dashboard.size_date_range
		@sizes 			= @sizes.order('created_at DESC')
	end

	def journal
		filter_products if params[:query].present?
		@dashboard 	= Dashboard.new((params[:search]))
		@sizes 		||= @dashboard.size_date_range
		@sizes 			= @sizes.order('created_at DESC')
	end

	private

	def dashboard_buttons_params
	  params.slice(:button)
	end

	def set_button
	  button = dashboard_buttons_params[:button]&.to_sym and [:products, :clients, :orders].include?(button) and button
	end

	def filter_products
	  return if params[:query].blank?
	  @sizes = Size.joins(:product).where('lower(products.title) LIKE ?', "%#{params[:query][:keyword].downcase }%")
	  .or(Size.joins(:product).where('lower(products.description) LIKE ?', "%#{params[:query][:keyword].downcase }%"))
	  .or(Size.joins(:product).where('lower(products.color) LIKE ?', "%#{params[:query][:keyword].downcase }%"))
		.or(Size.joins(:product).where('lower(products.brand) LIKE ?', "%#{params[:query][:keyword].downcase }%"))
	end
end
