module Admin
	module NavigationHelper
		def active_submenu_for(menu_name)
			case menu_name
			when 'article'
				['admin/products', 'admin/stocks'].include?(params[:controller])
			when 'sales'
				['admin/sales'].include?(params[:controller])
			end
		end
	end
end