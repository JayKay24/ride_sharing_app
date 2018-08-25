class Ride < ApplicationRecord
  validates :origin, :destination, :take_off_time,
            :take_off_date,
            presence: true

  belongs_to :vehicle
  has_many :subscriptions
  has_many :users, through: :subscriptions
end
