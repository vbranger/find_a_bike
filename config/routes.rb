Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  post 'localization', to: 'requests#localization'
  resources :requests, only: [:new, :index, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
