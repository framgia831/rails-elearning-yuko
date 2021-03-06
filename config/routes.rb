Rails.application.routes.draw do
  root 'home#index'
  # get "/" => "dashboard"
  get 'signup' => 'users#new'
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'

  resources :categories
  resources :lessons 
  resources :relationships
  resources :dashboard
  resources :words

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
