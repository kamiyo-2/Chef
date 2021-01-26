FactoryBot.define do
  factory :user do
    name              {Faker::Name.initials(number: 5)}
    profile           {"profile"}
    department        {"department"}
    email                 {Faker::Internet.free_email}
    password              {"123qwe"}
    password_confirmation {password}
  end
end

