require 'rails_helper'
require_relative '../helpers/request_helpers.rb'

RSpec.describe VehiclesController do
  include Helpers::Controllers

  let(:user) { create(:user) }

  describe 'GET#index' do
    context 'without logging in' do
      it "displays 'Sign In'" do
        get '/vehicles'

        follow_redirect!

        expect(response.body).to include('Sign In')
      end
    end
    context 'while logged in' do
      before do
        log_in
      end
      it "displays'You have no vehicles registered at the moment.'" do
        expect(response).to redirect_to(action: 'new', controller: 'vehicles')
        follow_redirect!

        get '/vehicles'
        expect(response.body).to include(
          'You have no vehicles registered at the moment.'
        )
      end

      it 'adds registers a new vehicle' do
        register_vehicle

        expect(response).to redirect_to(action: 'index', controller: 'vehicles')
        follow_redirect!

        expect(response.body).to include('You successfully created a vehicle!')
        expect(Vehicle.count).to eq(1)
      end

      it 'updates a new vehicle' do
        register_vehicle

        get '/vehicles/show', params: { id: Vehicle.first.id }

        expect(response.body).to include('Update Vehicle')
        post '/vehicles/update',params: {
          vehicle: {
            id: Vehicle.first.id,
            make: 'Tesla',
            reg_no: 'KJG 678 D',
            no_of_seats: 4,
            vehicle_type: 'Sedan'
          }
        }

        follow_redirect!
        expect(response.body).to include('You successfully updated the vehicle')
        expect(Vehicle.first.make).to eq('Tesla')
      end

      it 'deregisters a vehicle' do
        register_vehicle

        get "/vehicles/destroy/#{Vehicle.first.id}"

        follow_redirect!
        expect(response.body).to include('You successfully  deregistered the vehicle')
        expect(Vehicle.count).to eq(0)
      end
    end
  end
end
