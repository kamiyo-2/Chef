FactoryBot.define do
  factory :foodstuff do
    material                  {Faker::String.random(length: 4)}
    quantity                  {Faker::String.random(length: 4)}
    association :recipe
  end
end
