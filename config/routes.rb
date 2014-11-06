Rails.application.routes.draw do
  resources :perspectives
  root to: 'pages#index'
end
