Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  root 'plans#index'
  resources :plans do
    resources :likes, only: %i[create destroy]
    resources :bookmarks, only: %i[create destroy]
  end
end
