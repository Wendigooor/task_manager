FactoryBot.define do
  factory :task do
    description 'description'
    association :author, factory: :user
    family
  end
end
