FactoryBot.define do
  factory :user do
    name              {"test"}
    profile           {"profile"}
    department        {"department"}
    email                 {"test@example"}
    password              {"123qwe"}
    password_confirmation {password}
  end
end

