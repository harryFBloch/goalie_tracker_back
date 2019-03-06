Rails.application.routes.draw do
  resources :blocks, only: [:create, :destroy]
  resources :goals, only: [:create, :destroy]
  resources :goalies, only: [:index, :show, :create]
  resources :games, exept: [:delete]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
