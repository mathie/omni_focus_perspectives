Rails.application.routes.draw do
  resources :perspectives, only: [ :new, :create ]
  root to: 'pages#index'
end
