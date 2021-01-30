FactoryBot.define do
  factory :comment do
    text                  {"りんご"}
    association :user 
    association :recipe
  end
end
