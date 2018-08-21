Rails.application.routes.draw do
  # get 'vehicles/index'
  # get 'vehicles/create'
  get 'home/index'
  controller :users do
    get 'users/new' => :new
    post 'users/' => :create
  end

  controller :sessions do
    get 'sessions/login' => :new, as: 'new_session'
    post 'sessions/' => :create
    get 'sessions/home' => :home
    get 'sessions/logout' => :destroy
  end

  controller :vehicles do
    get 'vehicles/new' => :new, as: 'new_vehicle'
    get 'vehicles/' => :index, as: 'all_vehicles'
    post 'vehicles/' => :create
  end

  # root 'sessions#home', as: 'home'
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
