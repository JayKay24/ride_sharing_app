class Vehicle < ApplicationRecord
  validates :make, :vehicle_type,
            presence: true

  validates :reg_no,
            presence: true,
            format: { with: /([A-Z]){3}\s([0-9]){3}\s([A-Z])/,
                      message: 'Registration number must be in the ' \
                       'format "KBA 234 D"' }

  validates :no_of_seats,
            numericality: { only_integer: true }

  belongs_to :user
  has_many :rides, dependent: :destroy
end
