Rails.application.routes.draw do
 	devise_for :users, :controllers => { registrations: 'registrations' }
 	root to: "categories#index"

 		resources :users, only: [:index, :show, :edit, :update]

 		resources :products

	 	resources :categories, only: [:index, :show] do 
	 		resources :products
	 	end



end
