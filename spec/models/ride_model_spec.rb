require 'rails_helper'

RSpec.describe Ride, type: :model do
  it { is_expected.to validate_presence_of :origin }
  it { is_expected.to validate_presence_of :destination }
  it { is_expected.to validate_presence_of :take_off_time }
  it { is_expected.to validate_presence_of :take_off_date }
  it { is_expected.to belong_to :vehicle }
  it { is_expected.to have_many :subscriptions }
  it { is_expected.to have_many :users }
end
