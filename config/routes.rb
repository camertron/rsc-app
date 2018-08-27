Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'programs#new'

  resources :users, except: [:show]
  get '/sign_up' => 'users#new', as: 'sign_up'

  resources :programs
  resources :instructions, only: [:index]
  resources :exercises, only: [:index]

  resources :sessions, only: [:new, :create, :destroy]
  get '/login' => 'sessions#new', as: 'login'
  delete '/logout' => 'sessions#destroy', as: 'logout'
end
