Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  get 'profile', to: 'users#profile'
  post 'buy/destroy', to: 'buys#destroy'
  get 'users/list/:id', to: 'items#listusers', as: 'userlist'
  resources :items
  resources :buys
 
  root to: "site#index"
end
