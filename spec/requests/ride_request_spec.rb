require 'rails_helper'
require_relative '../helpers/request_helpers.rb'

RSpec.describe RidesController do
  include Helpers::Controllers

  context 'without logging in' do
    it 'displays "Sign In"' do
      post '/rides/create', params: {
        ride: {
          vehicle_id: 1,
          origin: 'Ukunda',
          destination: 'Takaungu',
          take_off_time: '2:32',
          take_off_date: '12/09/2018'
        }
      }

      follow_redirect!
      expect(response.body).to include('Sign In')
    end
  end

  context 'while logged in' do
    it 'creates a new ride' do
      create_ride_offer

      follow_redirect!
      expect(response.body).to include('You successfully created a ride!')
      expect(Ride.count).to eq(1)
    end

    it 'updates a new ride' do
      create_ride_offer

      follow_redirect!

      post '/rides/update', params: {
        ride: {
          id: Ride.first.id,
          origin: 'Smallville',
          destination: 'Metropolis',
          take_off_time: '3:23',
          take_off_date: '11/12/2018'
        }
      }

      follow_redirect!
      expect(response.body).to include('You successfully edited the ride offer!')
      expect(Ride.first.origin).to eq('Smallville')
    end

    it 'cancels a ride offer' do
      create_ride_offer

      get "/rides/destroy/#{Ride.first.id}"

      follow_redirect!
      expect(response.body).to include('You successfully cancelled the ride')
      expect(Ride.count).to eq(0)
    end
  end
end
