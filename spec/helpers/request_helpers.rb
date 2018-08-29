module Helpers
  module Controllers
    def log_in
      post '/users', params: {
        user: {
          first_name: 'Clark',
          last_name: 'Kent',
          username: 'Superman',
          email: 'clark@example.com', 
          password: 'Qwertyuiop123#',
          password_confirmation: 'Qwertyuiop123#'
        }
      }
    end

    def register_vehicle
      log_in

      post '/vehicles', params: {
        vehicle: {
          make: 'Toyota',
          reg_no: 'KXD 345 A',
          no_of_seats: 5,
          vehicle_type: 'Hatchback'
        }
      }
    end

    def create_ride_offer
      log_in

      register_vehicle

      post "/rides/create", params: {
        ride: {
          vehicle_id: Vehicle.first.id,
          origin: 'Takaungu',
          destination: 'Ukunda',
          take_off_time: '2:30',
          take_off_date: '12/08/2018'
        }
      }
    end

    def subscribe_to_ride_offer
      create_ride_offer

      get "/subscriptions/create/#{Ride.first.id}"
    end
  end
end
