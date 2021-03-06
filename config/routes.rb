Rails.application.routes.draw do
  get 'users/show'
  get 'users/destroy'
  get '/stylesheet', to: 'pages#style_sheet'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'frontend', to: 'pages#frontend'
  get 'profile', to: 'users#show'

  resources :learning_opportunities
  resources :user_bookmarks, only: [:new, :create, :destroy]
end
