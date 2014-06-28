Rails.application.routes.draw do
  get 'comments/create'

  get 'sign_in', to: 'sessions#create'

  resources :posts, only: [:index, :show] do
    resources :comments, only: :create
  end
end
