Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  get 'profile', to: 'users#profile'
  post 'buy/destroy', to: 'buys#destroy'
  resources :items
  resources :buys
 
  root to: "site#index"
end
