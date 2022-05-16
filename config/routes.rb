Rails.application.routes.draw do
  devise_for :users

	# Defines the root path route ("/")
	root "users#index"
	
	#Resources routes
	resources :users, only: [:index] do
		resources :recipes, except: [:edit, :update] 
		resources :foods, except: [:edit, :update]
		resources :recipe_foods, only: [:index]
	end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
