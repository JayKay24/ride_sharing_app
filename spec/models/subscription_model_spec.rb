require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it 'should belong to a user' do
    should belong_to :user
  end

  it 'should belong to a ride' do
    should belong_to :ride
  end
end
