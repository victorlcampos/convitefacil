Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :parties, only: [:new, :create] do
    resources :invites, only: [:show, :update] do
      resources :guests, only: [:edit, :update]
    end
  end

  namespace :admin do
    resources :parties, only: [:edit, :update] do
      resource :backgrounds, only: [:destroy], controller: 'party/backgrounds'

      resources :invites, only: [:index, :new, :create, :edit, :update, :destroy] do
        resources :guests, only: [:index, :new, :create, :edit, :update, :destroy]
      end
    end
  end

  root "parties#new"
end
