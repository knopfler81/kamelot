Rails.application.routes.draw do
 	devise_for :users, :controllers => { registrations: 'registrations' }
 	root to: "categories#index"

 		resources :users, only: [:index, :show, :edit, :update]

 		resources :products

 		#resources :order_items

	 	resources :categories, only: [:index, :show] do 
	 		resources :products
	 	end


	 	get 'cart', to: "order_items#index"
	 	resources :order_items, path: '/cart/items'

end
