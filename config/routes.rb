Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  get 'profile', to: 'users#profile'
  get 'buys', to: 'users#buys', as:'user_buys'
  get 'messages', to: 'users#messages', as:'user_messages'
  post 'buy/destroy', to: 'buys#destroy'
  get 'users/list/:id', to: 'items#listusers', as: 'userlist'
  resources :items
  resources :buys
  resources :messages, only: [:create, :show, :destroy, :new]
  root to: "site#index"

  namespace :api do
    namespace :v1 do
      get 'buys/:id/setpayment', to: 'buys#setpayment', as: 'setpayment'
      get 'buys/:id/paymentconfirm', to: 'buys#paymentconfirm', as: 'paymentconfirm'
      get 'buys/:id/setitem', to: 'buys#setitem', as: 'setitem'
      get 'buys/:id/itemconfirm', to: 'buys#itemconfirm', as: 'itemconfirm'
    end
  end
end
