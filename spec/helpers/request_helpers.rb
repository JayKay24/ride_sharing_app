module Helpers
  module Controllers
    def log_in
      post '/users', params: {
        user: attributes_for(:user)
      }
    end

    def register_vehicle
      log_in

      post '/vehicles', params: {
        vehicle: attributes_for(:toyota)
      }
    end

    def create_ride_offer
      log_in

      register_vehicle

      ride_attributes = attributes_for(:ride)
      ride_attributes[:vehicle_id] = Vehicle.first.id
      post '/rides', params: { ride: ride_attributes }
    end

    def register_different_user
      user = create(:alexander)
      post '/sessions', params: {
        session: {
          username_or_email: user.username,
          login_password: 'Qwertyuiop123#'
        }
      }
    end

    def subscribe_to_ride_offer
      create_ride_offer

      delete "/sessions/#{User.first.id}"

      register_different_user

      post '/subscriptions', params: {
        subscription: {
          id: Ride.first.id
        }
      }
    end

    def expect_redirection_to(path, content)
      expect(response).to redirect_to(path)
      follow_redirect!
      expect(response.body).to include(content)
    end
  end
end
