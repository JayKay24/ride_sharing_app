require 'rails_helper'
require_relative '../helpers/request_helpers.rb'

RSpec.describe RidesController do
  include Helpers::Controllers

  describe 'index' do
    context 'while logged out' do
      include_examples 'redirection to sign in example',
                       http_method: 'get',
                       initial_path: '/rides',
                       expected_path: '/sessions/new',
                       content: 'Sign In',
                       method_params: {}
    end

    context 'while logged in' do
      before { log_in }
      it 'should display the ride list view' do
        get '/rides'

        expect(response.body).to include(
          'There are no ride offers at the moment.'
        )
      end
    end
  end

  describe 'new' do
    context 'while logged out' do
      include_examples 'redirection to sign in example',
                       http_method: 'get',
                       initial_path: '/rides/new',
                       expected_path: '/sessions/new',
                       content: 'Sign In',
                       method_params: {}
    end

    context 'while logged in' do
      before { log_in }
      it 'should display the new ride view' do
        get '/rides/new'

        expect(response.body).to include('Create Ride Offer')
      end
    end
  end

  describe 'edit' do
    context 'while logged out' do
      include_examples 'redirection to sign in example',
                       http_method: 'get',
                       initial_path: '/rides/1/edit',
                       expected_path: '/sessions/new',
                       content: 'Sign In',
                       method_params: {}
    end

    context 'while logged in' do
      it 'should display the edit ride view' do
        create_ride_offer

        get "/rides/#{Ride.first.id}/edit"
        expect(response.body).to include('Edit Ride Offer')
        expect(response.body).to include('Takaungu')
      end
    end
  end

  describe 'create' do
    context 'while logged out' do
      include_examples 'redirection to sign in example',
                       http_method: 'post',
                       initial_path: '/rides',
                       expected_path: '/sessions/new',
                       content: 'Sign In',
                       method_params: {
                         params: {
                           ride: {
                             vehicle_id: 1,
                             origin: 'Ukunda',
                             destination: 'Takaungu',
                             take_off_time: '2.32',
                             take_off_date: '12/09/2018'
                           }
                         }
                       }
    end

    context 'while logged in' do
      it 'should create a ride offer' do
        create_ride_offer
        expect_redirection_to('/rides', 'You successfully created a ride!')
      end
    end
  end

  describe 'update' do
    context 'while logged out' do
      include_examples 'redirection to sign in example',
                       http_method: 'put',
                       initial_path: '/rides/1',
                       expected_path: '/sessions/new',
                       content: 'Sign In',
                       method_params: {
                         params: {
                           ride: {
                             origin: 'Smallville',
                             destination: 'Metropolis',
                             take_off_time: '2:30',
                             take_off_date: '12/08/2018'
                           }
                         }
                       }
    end

    context 'while logged in' do
      it 'should update a ride offer' do
        create_ride_offer

        put "/rides/#{Ride.first.id}", params: {
          ride: {
            origin: 'Smallville',
            destination: 'Metropolis',
            take_off_time: '3:23',
            take_off_date: '11/12/2018'
          }
        }
        expect_redirection_to(
          '/rides', 'You successfully edited the ride offer!'
        )
        expect(response.body).to include('Smallville')
      end
    end
  end

  describe 'destroy' do
    context 'while logged out' do
      include_examples 'redirection to sign in example',
                       http_method: 'delete',
                       initial_path: '/rides/1',
                       expected_path: '/sessions/new',
                       content: 'Sign In',
                       method_params: {}
    end
  end

  context 'while logged in' do
    it 'should cancel a ride offer' do
      create_ride_offer

      delete "/rides/#{Ride.first.id}"
      expect_redirection_to('/rides', 'You successfully cancelled the ride')
      expect(Ride.count).to eq(0)
    end
  end
end
