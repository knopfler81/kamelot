Rails.application.routes.draw do
  devise_for :users
 	root to: "categories#index"

 	resources :products, only: [:create, :new, :destroy, :show, :edit, :update]

 	resources :categories, only: [:index, :show] do 
 		resources :products
 	end

end
