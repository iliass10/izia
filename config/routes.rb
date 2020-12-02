Rails.application.routes.draw do
  get 'results/new'
  get 'results/create'
  get 'results/index'
  get 'results/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
