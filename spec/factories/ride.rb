FactoryBot.define do
  factory :ride, class: 'Ride' do
    origin 'Takaungu'
    destination 'Ukunda'
    take_off_time '2:30'
    take_off_date '12/08/2018'
    tesla
  end
end
