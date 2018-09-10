require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it { is_expected.to validate_presence_of :make }
  it { is_expected.to validate_presence_of :vehicle_type }
  it { is_expected.to validate_presence_of :reg_no }
  it { is_expected.to validate_presence_of :no_of_seats }
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :rides }
end
