Rails.application.routes.draw do
  resources :perspectives, only: [ :new, :create, :edit ]
  root to: 'pages#index'
end
