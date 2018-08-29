require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with valid attributes provided' do
    it 'should be valid with valid attributes' do
      should validate_presence_of :first_name
      should validate_presence_of :last_name
      should validate_presence_of :username
      should validate_presence_of :email
    end

    it 'should have many vehicles' do
      should have_many :vehicles
    end

    it 'should have many subscriptions' do
      should have_many :subscriptions
    end
  end

  context 'without valid attributes provided' do
    it 'should be invalid without valid attributes' do
      expect(User.new).to be_invalid
    end

    it 'should have a unique email' do
      should validate_uniqueness_of :email
    end
  end
end
