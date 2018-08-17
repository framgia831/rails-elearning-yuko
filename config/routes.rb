Rails.application.routes.draw do
  root 'home#index'
  # get "/" => "dashboard"
  get 'signup' => 'users#new'
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'

  resources :users
  resources :categories
  resources :lessons 
  resources :relationthips

  namespace :admin do
  	resources :categories do
      resources :words
    end
  end

  resources :lessons do
    resources :lesson_words
  end

  resources :users do
    member do
      get :following, :followers
    end
  end


end
