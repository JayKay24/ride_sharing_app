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

  controller :rides do
    get 'rides/index' => :index, as: 'all_rides'
    get 'rides/show' => :show
    get 'rides/new/:vehicle_id' => :new, as: 'new_ride'
    post 'rides/create' => :create
    get 'rides/update' => :update
    get 'rides/destroy' => :destroy
  end

  controller :subscriptions do
    get 'subscriptions/index' => :index, as: 'my_subscriptions'
    get 'subscriptions/create/:ride_id' => :create, as: 'subscribe'
    get 'subscriptions/update'
    get 'subscriptions/destroy'
  end

  # root 'sessions#home', as: 'home'
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
