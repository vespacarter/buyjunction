Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  get 'profile', to: 'users#profile'
  get 'buys', to: 'users#buys', as:'user_buys'
  get 'messages', to: 'users#messages', as:'user_messages'
  get 'users/list/:id', to: 'items#listusers', as: 'userlist'
  get 'search', to: 'site#search', as:'search_item'
  get 'categories', to: 'site#categories', as:'search_categories'
  resources :items
  resources :buys
  resources :messages, only: [:create, :show, :destroy, :new]
  resources :scores, only:[:create]
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
