Rails.application.routes.draw do
  devise_for :users

	# Defines the root path route ("/")
	root "users#index"

	devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

	#Resources routes
	resources :users, only: [:index] do
		resources :recipes, except: [:edit, :update] do
			resources :recipe_foods, only: [:new, :create, :destroy]
		end
		resources :foods, except: [:edit, :update]
	end
	resources :public_recipes, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
