module Admin::NavigationHelper
	def active_submenu_for(menu_name)
		case menu_name
		when 'products'
			['admin/products','admin/stocks'].include?(params[:controller])
		when 'sales'
			['admin/sales'].include?(params[:controller])
		when 'orders'
			['admin/orders'].include?(params[:controller])
		when 'suppliers'
			['admin/suppliers'].include?(params[:controller])
		when 'users'
			['admin/users'].include?(params[:controller])
		when 'returnings'
			['admin/returnings'].include?(params[:controller])
		when 'dashboards'
			['admin/dashboards'].include?(params[:controller])
		end
	end
end
