Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get 'frontend', to: 'pages#frontend'
get 'profile', to: 'users#show'


end
