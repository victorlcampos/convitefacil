Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :parties, only: [:new, :create]

  namespace :admin do
    resources :parties, only: [:edit, :update] do
      resources :invites, only: [:index, :new, :create, :edit, :update]
    end
  end

  root "parties#new"
end
