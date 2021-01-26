FactoryBot.define do
  factory :foodstuff do
    material                  {"りんご"}
    quantity                  {"5個"}
    association :recipe
  end
end
