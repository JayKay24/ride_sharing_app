require 'rails_helper'

RSpec.describe Ride, type: :model do
  context 'with valid attributes provided' do
    it 'should create a new ride using a registered vehicle' do
      should validate_presence_of :origin
      should validate_presence_of :destination
      should validate_presence_of :take_off_time
      should validate_presence_of :take_off_date
    end
  end

  it 'should belong to a vehicle' do
    should belong_to :vehicle
  end

  it 'should have many subscriptions' do
    should have_many :subscriptions
  end

  it 'should have many users' do
    should have_many :users
  end
end
