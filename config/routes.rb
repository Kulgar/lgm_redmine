Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  get "admin", to: "pages#admin"

  # resources :tasks

  namespace :admin do
    resources :categories
  end

  resources :projects do
    resources :tasks
  end
end
