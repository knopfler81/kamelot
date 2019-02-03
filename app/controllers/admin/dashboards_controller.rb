class Admin::DashboardsController < Admin::ApplicationController

	def show
		@button ||= set_button || :orders
		@dashboard = Dashboard.new
	end

	private

	def dashboard__params
	  params.slice(:button)
	end

	def set_button
	  button = dashboard__params[:button]&.to_sym and [:orders, :products, :clients].include?(button) and button
	end
end
