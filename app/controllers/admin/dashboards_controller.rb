class Admin::DashboardsController < Admin::ApplicationController

	def show
		@button ||= set_button || :journal
		@dashboard = Dashboard.new(params[:search])
		@sizes = @dashboard.size_date_range
		@sizes = @sizes.order('created_at DESC')
	end

	private

	def dashboard__params
	  params.slice(:button)
	end

	def set_button
	  button = dashboard__params[:button]&.to_sym and [:journal, :products, :clients, :orders].include?(button) and button
	end
end
