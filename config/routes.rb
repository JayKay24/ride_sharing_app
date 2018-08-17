Rails.application.routes.draw do
  get 'home/index'
  controller :users do
    get 'users/new' => :new
    post 'users/' => :create
  end

  controller :sessions do
    get 'sessions/login' => :login, as: 'new_session'
    post 'sessions/' => :login_attempt
    get 'sessions/home' => :home
    get 'sessions/logout' => :logout
  end

  # root 'sessions#home', as: 'home'
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
