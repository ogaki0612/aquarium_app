Rails.application.routes.draw do
  devise_for :users
  root to:"aquas#index"
  resources :aquas do
    resources :comments, only: [ :create ]
  end
end
