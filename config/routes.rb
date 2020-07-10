Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :notification, only: [:create, :show]
  resources :admin, only: [:create, :show, :update, :destroy]
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]

  delete :logout, to: "sessions#logout"

  get :logged_in, to: "sessions#logged_in"
  get :logged_in, to: "sessions#logged_in"

  get :admin, to: "admin#index"

  root to: "notification#index"
end
