require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to have_many :vehicles }
  it { is_expected.to have_many :subscriptions }
  it { is_expected.to validate_uniqueness_of :email }

  context 'without valid attributes provided' do
    it 'should be invalid without valid attributes' do
      expect(User.new).to be_invalid
    end
  end
end
