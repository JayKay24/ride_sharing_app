class Vehicle < ApplicationRecord
  validates :make, :reg_no, :vehicle_type,
            presence: true

  validates :no_of_seats,
            numericality: { only_integer: true }

  belongs_to :user
  has_many :rides, dependent: :destroy
end
