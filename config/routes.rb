Rails.application.routes.draw do
 	devise_for :users, :controllers => { registrations: 'registrations' }
 	root to: "categories#index"

 		resources :users, only: [:index, :show, :edit, :update]

 		resources :products

	 	resources :categories, only: [:index, :show] do 
	 		resources :products
	 	end


	 	get 'cart', to: "order_items#index"
	 	resources :order_items, path: '/cart/items'

	 	resources :users do 
			resources :orders, only: [:index, :show]
		end


		resources :orders, only: [:index, :show]

		get '/cart/checkout', to: "orders#new", as: :checkout
		patch '/cart/checkout', to: 'orders#create'

end
