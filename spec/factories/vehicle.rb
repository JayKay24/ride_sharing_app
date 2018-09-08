FactoryBot.define do
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
end
