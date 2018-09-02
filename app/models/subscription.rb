class Subscription < ApplicationRecord
  after_create :decrement_seat_number
  after_destroy :increment_seat_number

  belongs_to :user
  belongs_to :ride

  validate :user_cannot_re_subscribe_to_ride
  validate :user_cannot_subscribe_to_own_ride
  validate :ride_must_not_be_full_to_subscribe

  private

  def user_cannot_re_subscribe_to_ride
    errors.add(:user, 'cannot subscribe to this ride again') if
      user.rides.include?(ride)
  end

  def user_cannot_subscribe_to_own_ride
    errors.add(:user, 'cannot subscribe to a ride he/she has created') if
      user.id == ride.vehicle.user_id
  end

  def ride_must_not_be_full_to_subscribe
    errors.add(:ride, 'is already full') if ride.remaining_seats <= 0
  end

  def increment_seat_number
    ride.update(remaining_seats: ride.remaining_seats + 1)
  end

  def decrement_seat_number
    ride.update(remaining_seats: ride.remaining_seats - 1)
  end
end
