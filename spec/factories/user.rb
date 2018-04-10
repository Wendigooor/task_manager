FactoryBot.define do
  factory :user do
    first_name 'first_name'
    last_name 'last_name'
    sequence(:email) { |n| "test#{n}@example.com" }
    password '123456789'

    after(:build) do |user|
      user.skip_confirmation_notification!
    end
  end
end
