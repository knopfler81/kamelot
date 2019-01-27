class Admin::DashboardsController < ApplicationController


	def show
		@orders = Order.all
	end
end
