Rails.application.routes.draw do
  devise_for :users
  root 'plans#index'
  resources :plans do
    resources :likes, only: %i[create destroy]
  end
end
