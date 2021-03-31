Rails.application.routes.draw do
  resources :categories
  devise_for :admins
  resources :products
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :products do
    post 'csv_upload'
  end
end
