Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :results, only: [:new, :create, :index, :show]
  resources :appointments, only: [:new, :create, :index, :show]
end


