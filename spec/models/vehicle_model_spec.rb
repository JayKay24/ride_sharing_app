require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  context 'with valid attributes provided' do
    it 'should create a new vehicle with a logged in user' do
      should validate_presence_of :make
      should validate_presence_of :vehicle_type
      should validate_presence_of :reg_no
      should validate_presence_of :no_of_seats
    end
  end

  it 'should belong to one user' do
    should belong_to :user
  end

  it 'should have many rides' do
    should have_many :rides
  end
end
