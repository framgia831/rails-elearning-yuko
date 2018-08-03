Rails.application.routes.draw do
  root 'home#index'
  # get "/" => "dashboard"
  get 'signup' => 'users#new'
  resources :users

end
