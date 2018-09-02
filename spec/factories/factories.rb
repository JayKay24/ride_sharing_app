FactoryBot.define do
  factory :alexander, class: 'User' do
    first_name 'Alexander'
    last_name 'Luthor'
    username 'Lex'
    email 'lex@example.com'
    password 'Qwertyuiop123#'
    password_confirmation 'Qwertyuiop123#'
  end

  factory :user do
    first_name 'Clark'
    last_name 'Kent'
    sequence(:username) { |n| "Superman#{n}" }
    sequence(:email) { |n| "test#{n}@factory.com" }
    password 'Qwertyuiop123#'
    password_confirmation 'Qwertyuiop123#'
    factory :user_with_teslas do
      transient do
        teslas_count { 1 }
      end

      after(:create) do |clark, evaluator|
        create_list(:tesla, evaluator.teslas_count, user: clark)
      end
    end
  end

  factory :tesla, class: 'Vehicle' do
    make 'Tesla'
    no_of_seats 5
    vehicle_type 'Sedan'
    reg_no 'KBP 345 P'
    user
    factory :tesla_with_rides do
      transient do
        rides_count { 1 }
      end

      after(:create) do |tesla, evaluator|
        create_list(:ride, evaluator.rides_count, vehicle: tesla)
      end
    end
  end

  factory :toyota, class: 'Vehicle' do
    make 'Toyota'
    no_of_seats 5
    vehicle_type 'Hatchback'
    reg_no 'KXD 345 A'
    user
    factory :toyota_with_rides do
      transient do
        rides_count { 1 }
      end

      after(:create) do |toyota, evaluator|
        create_list(:ride, evaluator.rides_count, vehicle: toyota)
      end
    end
  end

  factory :ride, class: 'Ride' do
    origin 'Takaungu'
    destination 'Ukunda'
    take_off_time '2:30'
    take_off_date '12/08/2018'
    tesla
  end
end
