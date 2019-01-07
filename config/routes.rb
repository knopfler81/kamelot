Rails.application.routes.draw do
 	devise_for :users, :controllers => { registrations: 'registrations' }
  
 	root to: "clients/products#index"

	require "sidekiq/web"
	
	authenticate :user, lambda { |u| u.admin? } do	 		
    mount Sidekiq::Web => '/sidekiq'

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


	namespace :clients  do

		resources :products

	 	resources :categories, only: [:index, :show] do 
	 		resources :products, only: [:index, :show]
	 	end

	 	get 'cart', to: "order_items#index"

	 	patch "cart", to: "order_items#update"


	 	resources :order_items, path: '/cart/items'

	 	resources :users, only: [:show] do 
			resources :orders, only: [:index, :show]
		end


		resources :orders, only: [:index, :show]

		get '/cart/checkout', to: "orders#new", as: :checkout
		patch '/cart/checkout', to: 'orders#create'
	end



end
