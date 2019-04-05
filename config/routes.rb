Rails.application.routes.draw do
 	devise_for :users, :controllers => { registrations: 'registrations' }
	

 	root to: "clients/pages#landing"

	authenticate :user, lambda { |u| u.admin? } do
		 		
  	require "sidekiq/web"
    require 'sidekiq/cron/web'
    mount Sidekiq::Web => '/sidekiq'

		namespace :admin do

			get '/products/qr_codes', to: "products#qr_codes"


			resources :products do 
    		resources :stickers
				member do
        	get :stock
      	end
    	end

    	resources :stickers, only: [:show, :destroy]

    		
    	resources :stocks, only: [:create, :update, :destroy]

			resources :products do
				resources :attachments, only: [:create, :destroy]
			end


			resources :products do
				resources :variants do 
				end
			end

			resources :suppliers

			resources :variants, only: :index

			resources :stocks


			get "list", to: "products#list"

		 	resources :categories do 
		 		resources :products
		 	end

		 	if FeatureSwitch.enabled?(:stats)
			 	resource :dashboard
			 	get "dashboard/journal", to: "dashboards#journal"
			end

		 	resources :sizes do
		 		get 'decrease', on: :member
		 		get 'increase', on: :member
		 	end

		 	resources :users do 
				resources :orders, only: [:index, :show]
			end

			resources :sales

			resources :orders

		  get "landing", to: "pages#landing"


			#### NE PAS CHANGER L'ORDRE DE CES ROUTES ####
			get "basket", to: "sale_items#index"
			patch "basket", to: "sale_items#update"
			resources :sale_items, path: '/basket/items'
			get "/basket/cash", to: "sales#new", as: :cash
			patch "/basket/cash", to: "sales#create"
		 	############################################
		end
	end	 		 		


	namespace :clients  do

		authenticate :user, lambda { |u| u.admin? } do	
			resource :customization, only: [:show, :update], controller: "customization" do
				member do
	      	get :reset
	    	end
	    end
		end

		resources :favorites, only: :index

		resources :billing_addresses
		
		resources :shipping_addresses
		
		resources :products do 
			resources :favorites
		end

	 	resources :categories, only: [:index, :show] do
	 		resources :products, only: [:index, :show]
	 	end

	 	resources :users, only: [:show] do 
			resources :orders, only: [:index, :show]
		end


		get "myaccount", to: "users#show"
		get "myaddresses", to: "users#addresses"

		resources :orders, only: [ :index, :show, :create, :edit, :update] do
		  resources :payments, only: [:new, :create]
		  resources :returnings do 
		  	patch "returning_items", to: "returning_items#update"
		  	resources :returning_items
		  end
		end

		#### NE PAS CHANGER L'ORDRE DE CES ROUTES ####
	 	get 'cart', to: "order_items#index"
	 	patch "cart", to: "order_items#update"
	 	resources :order_items, path: '/cart/items'
		get '/cart/checkout', to: "orders#new" , as: :checkout
		patch '/cart/checkout', to: 'orders#create'
    ####################################################

		get "landing", to: "pages#landing"
		get "secure_payment", to: "pages#secure_payment"
		get "delivery", to: "pages#delivery"
		get "general_condition_of_sales", to: "pages#general_condition_of_sales"
		get "legal_notice", to: "pages#legal_notice"
		get "confidentiality_policy", to: "pages#confidentiality_policy"
		get "cookies_policy", to: "pages#cookies_policy"
		get "sizes_guide", to: "pages#sizes_guide"
		get "site_map", to: "pages#site_map"

	end
end
