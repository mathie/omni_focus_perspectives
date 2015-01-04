Rails.application.routes.draw do
  [ :inbox,
    :projects,
    :contexts,
    :flagged,
    :review,
    :custom_projects,
    :custom_contexts
  ].each do |perspective|
    resources "#{perspective}_perspectives", only: [
      :show, :new, :create,
      :edit, :update, :destroy
    ]
  end

  resources :perspectives, only: [ :index ] do
    new do
      get :choose
    end
  end

  root to: 'pages#index'
end
