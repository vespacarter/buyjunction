Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  get 'profile', to: 'users#profile'
  get 'buys', to: 'users#buys', as:'user_buys'
  get 'messages', to: 'users#messages', as:'user_messages'
  post 'buy/destroy', to: 'buys#destroy'
  get 'users/list/:id', to: 'items#listusers', as: 'userlist'
  resources :items
  resources :buys
  resources :messages, only: [:create, :show, :destroy]
  post 'createmessage', to: "messages#generate", as: 'create_message'
  post 'api/main', to: 'api/api#main'
  root to: "site#index"
end
