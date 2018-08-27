Rails.application.routes.draw do
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
    get 'vehicles/show/' => :show, as: 'show_vehicle'
    post 'vehicles/update/' => :update
    get 'vehicles/destroy/:id' => :destroy, as: 'deregister_vehicle'
  end

  controller :rides do
    get 'rides/index' => :index, as: 'all_rides'
    get 'rides/show' => :show, as: 'show_ride'
    get 'rides/new/:vehicle_id' => :new, as: 'new_ride'
    post 'rides/create' => :create
    post 'rides/update/' => :update, as: 'update_ride'
    get 'rides/destroy/:id' => :destroy, as: 'cancel_ride'
  end

  controller :subscriptions do
    get 'subscriptions/index' => :index, as: 'my_subscriptions'
    get 'subscriptions/create/:id' => :create, as: 'subscribe'
    get 'subscriptions/update'
    get 'subscriptions/destroy/:id' => :destroy, as: 'unsubscribe'
  end

  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
