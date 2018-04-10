FactoryBot.define do

  sequence(:email) { |n| "test#{n}@example.com" }

  factory :user do
    first_name 'first_name'
    last_name 'last_name'
    email { generate(:email) }
    password '123456789'

    after(:build) do |user|
      user.skip_confirmation_notification!
    end
  end
end
