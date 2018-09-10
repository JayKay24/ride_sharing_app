require 'rails_helper'
require_relative '../helpers/request_helpers.rb'

RSpec.describe SubscriptionsController do
  include Helpers::Controllers

  describe 'index' do
    context 'while logged out' do
      include_examples 'redirection to sign in example',
                       http_method: 'get',
                       initial_path: '/subscriptions',
                       expected_path: '/sessions/new',
                       content: 'Sign In',
                       method_params: {}
    end

    context 'while logged in' do
      before { log_in }
      it 'should display subscriptions view' do
        get '/subscriptions'

        expect(response.body).to include(
          'You currently have no ride subscriptions'
        )
        expect(Subscription.count).to eq(0)
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
                           subscription: {
                             id: 1
                           }
                         }
                       }
    end

    context 'while logged in' do
      it 'should subscribe to a ride offer' do
        subscribe_to_ride_offer
        expect_redirection_to('/subscriptions', 'Takaungu')
      end
    end
  end

  describe 'destroy' do
    context 'while logged out' do
      include_examples 'redirection to sign in example',
                       http_method: 'delete',
                       initial_path: '/subscriptions/1',
                       expected_path: '/sessions/new',
                       content: 'Sign In',
                       method_params: {}
    end

    context 'while logged in' do
      it 'should unsubscribe from a ride offer' do
        subscribe_to_ride_offer

        delete "/subscriptions/#{Ride.first.id}"

        expect_redirection_to(
          '/subscriptions', 'You successfully unsubscribed from this ride'
        )
        expect(Subscription.count).to eq(0)
      end
    end
  end
end
