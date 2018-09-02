require 'rails_helper'
require_relative '../helpers/request_helpers.rb'

RSpec.describe VehiclesController do
  include Helpers::Controllers

  describe 'index' do
    context 'while logged out' do
      include_examples 'redirection to sign in example',
                       http_method: 'get',
                       initial_path: '/vehicles',
                       expected_path: '/sessions/new',
                       content: 'Sign In',
                       method_params: {}
    end

    context 'while logged in' do
      before { log_in }

      it "displays'You have no vehicles registered at the moment.'" do
        expect(response).to redirect_to(action: 'new', controller: 'vehicles')

        get '/vehicles'
        expect(response.body).to include(
          'You have no vehicles registered at the moment.'
        )
      end
    end
  end

  describe 'new' do
    context 'while logged out' do
      include_examples 'redirection to sign in example',
                       http_method: 'get',
                       initial_path: '/vehicles/new',
                       expected_path: '/sessions/new',
                       content: 'Sign In',
                       method_params: {}
    end

    context 'while logged in' do
      before { log_in }
      it 'should display the new vehicle view' do
        get '/vehicles/new'

        expect(response.body).to include('Register Vehicle')
        expect(response.request.path).to eq('/vehicles/new')
      end
    end
  end

  describe 'create' do
    context 'while logged out' do
      include_examples 'redirection to sign in example',
                       http_method: 'post',
                       initial_path: '/vehicles',
                       expected_path: '/sessions/new',
                       content: 'Sign In',
                       method_params: {
                         params: {
                           vehicle: {
                             make: 'Toyota',
                             no_of_seats: 5,
                             vehicle_type: 'Hatchback',
                             reg_no: 'KXD 345 A'
                           }
                         }
                       }
    end

    context 'while logged in' do
      it 'should register a vehicle' do
        register_vehicle

        expect(response).to redirect_to(action: 'index', controller: 'vehicles')
        expect_redirection_to(
          '/vehicles', 'You successfully created a vehicle!'
        )
        expect(Vehicle.count).to eq(1)
      end
    end
  end

  describe 'edit' do
    context 'while logged out' do
      include_examples 'redirection to sign in example',
                       http_method: 'get',
                       initial_path: '/vehicles/1/edit',
                       expected_path: '/sessions/new',
                       content: 'Sign In',
                       method_params: {}

    end

    context 'while logged in' do
      it 'should display the edit view' do
        register_vehicle

        get "/vehicles/#{Vehicle.first.id}/edit"

        expect(response.body).to include('Update Vehicle')
        expect(response.body).to include('Toyota')
        expect(response.request.path).to eq("/vehicles/#{Vehicle.first.id}/edit")
      end
    end
  end

  describe 'update' do
    context 'while logged out' do
      include_examples 'redirection to sign in example',
                       http_method: 'put',
                       initial_path: '/vehicles/1',
                       expected_path: '/sessions/new',
                       content: 'Sign In',
                       method_params: {
                         params: {
                           vehicle: {
                             make: 'Tesla',
                             reg_no: 'KJG 678 D',
                             no_of_seats: 4,
                             vehicle_type: 'Sedan'
                           }
                         }
                       }
    end

    context 'while logged in' do
      it 'should update a vehicle' do
        register_vehicle

        put "/vehicles/#{Vehicle.first.id}", params: {
          vehicle: {
            make: 'Tesla',
            reg_no: 'KJG 678 D',
            no_of_seats: 4,
            vehicle_type: 'Sedan'
          }
        }
        expect_redirection_to(
          '/vehicles', 'You successfully updated the vehicle'
        )
        expect(response.request.path).to include('/vehicles')
      end
    end
  end

  describe 'destroy' do
    context 'while logged out' do
      include_examples 'redirection to sign in example',
                       http_method: 'delete',
                       initial_path: '/vehicles/1',
                       expected_path: '/sessions/new',
                       content: 'Sign In',
                       method_params: {}
    end

    context 'while logged in' do
      it 'should deregister a vehicle' do
        register_vehicle

        delete "/vehicles/#{Vehicle.first.id}"
        expect_redirection_to(
          '/vehicles', 'You successfully  deregistered the vehicle'
        )
        expect(Vehicle.count).to eq(0)
        expect(response.request.path).to eq('/vehicles')
      end
    end
  end
end
