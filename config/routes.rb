Rails.application.routes.draw do
 	devise_for :users, :controllers => { registrations: 'registrations' }
 	

 	root to: "clients/categories#index"



	namespace :clients  do

		resources :products

	 	resources :categories, only: [:index, :show] do 
	 		resources :products, only: [:index, :show]
	 	end

	 	get 'cart', to: "order_items#index"
	 	resources :order_items, path: '/cart/items'

	 	resources :users, only: [:show] do 
			resources :orders, only: [:index, :show]
		end


		resources :orders, only: [:index, :show]

		get '/cart/checkout', to: "orders#new", as: :checkout
		patch '/cart/checkout', to: 'orders#create'
	end


	authenticate :user, lambda { |u| u.admin? } do	 		

		namespace :admin do

			resources :products

		 	resources :categories do 
		 		resources :products
		 	end


		 	resources :users do 
				resources :orders, only: [:index, :show]
			end

			resources :orders

			get '/cart/checkout', to: "orders#new", as: :checkout
			patch '/cart/checkout', to: 'orders#create'
		 			
		end
	end	 		 		

end
