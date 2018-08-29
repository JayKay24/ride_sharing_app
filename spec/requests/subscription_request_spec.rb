require 'rails_helper'
require_relative '../helpers/request_helpers.rb'

RSpec.describe SubscriptionsController do
  include Helpers::Controllers

  context 'without logging in' do
    it "should display 'Sign In'" do
      get '/subscriptions/index'

      follow_redirect!
      expect(response.body).to include('Sign In')
    end
  end

  context 'while logged in' do
    before do
      log_in
    end
    it 'should show all subscriptions' do
      get '/subscriptions/index'

      expect(response.body).to include(
        'You currently have no ride subscriptions'
      )
    end

    it 'should subscribe to a ride offer' do
      subscribe_to_ride_offer

      follow_redirect!
      expect(response.body).to include('Takaungu')
      expect(response.body).to include('All Rides')
    end
  end
end
