Rails.application.routes.draw do
  devise_for :users
 	root to: "categories#index"

 		resources :users

 		resources :products

	 	resources :categories, only: [:index, :show] do 
	 		resources :products
	 	end



end
