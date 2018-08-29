FactoryBot.define do
  factory :user do
    first_name 'Clark'
    last_name 'Kent'
    username 'Superman'
    email 'clark@example.com'
    password 'Qwertyuiop123#'
    password_confirmation 'Qwertyuiop123#'
  end

  factory :vehicle do
    make 'Tesla'
    no_of_seats 5
    vehicle_type 'Sedan'
    reg_no 'KBP 345 P'
  end
end
