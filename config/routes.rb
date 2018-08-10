Rails.application.routes.draw do
  root 'home#index'
  # get "/" => "dashboard"
  get 'signup' => 'users#new'
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  resources :users

  resources :categories

  namespace :admin do
  	resources :categories do
      resources :words
    end
  end

end
