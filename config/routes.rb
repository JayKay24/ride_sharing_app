Rails.application.routes.draw do
  resources :home, only: [:index]
  resources :users
  resources :sessions, only: %i[new create destroy home]
  resources :vehicles, except: %i[show]
  resources :rides, except: %i[show]
  resources :subscriptions, only: %i[index create destroy]

  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
