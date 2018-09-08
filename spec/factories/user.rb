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
end
