Rails.application.routes.draw do
 	devise_for :users, :controllers => { registrations: 'registrations' }
	

 	root to: "pages#landing"

	require "sidekiq/web"
	
	authenticate :user, lambda { |u| u.admin? } do	 		
    mount Sidekiq::Web => '/sidekiq'

		namespace :admin do

			resources :products

			resources :products do
				resources :attachments, only: [:create, :destroy]
			end

			get "desktop", to: "products#desktop"

		 	resources :categories do 
		 		resources :products
		 	end

		 	resource :dashboard

		 	resources :sizes do
		 		get 'decrease', on: :member
		 		get 'increase', on: :member
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

		resources :favorites, only: :index

		resources :billing_addresses
		
		resources :shipping_addresses
		
		resources :products do 
			resources :favorites
		end



	 	resources :categories, only: [:index, :show] do
	 		resources :products, only: [:index, :show]
	 	end

	 	get 'cart', to: "order_items#index"

	 	patch "cart", to: "order_items#update"


	 	resources :order_items, path: '/cart/items'

	 	resources :users, only: [:show] do 
			resources :orders, only: [:index, :show]
		end

		get "myaccount", to: "users#show"
		get "myaddresses", to: "users#addresses"

		resources :orders, only: [ :index, :show, :create] do
		  resources :payments, only: [:new, :create]
		end


		#resources :orders, only: [:index, :show]

		get '/cart/checkout', to: "orders#new" , as: :checkout
		patch '/cart/checkout', to: 'orders#create'
	end

	get "secure_payment", to: "pages#secure_payment"
	get "delivery", to: "pages#delivery"
	get "general_condition_of_sales", to: "pages#general_condition_of_sales"
	get "legal_notice", to: "pages#legal_notice"
	get "confidentiality_policy", to: "pages#confidentiality_policy"
	get "cookies_policy", to: "pages#cookies_policy"
	get "sizes_guide", to: "pages#sizes_guide"
	get "site_map", to: "pages#site_map"
	get "landing", to: "pages#landing"

end
