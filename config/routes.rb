Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'interpreter#index'
  resources :interpreter, only: [:index]
  resources :instructions, only: [:index]
  resources :exercises, only: [:index]
end
