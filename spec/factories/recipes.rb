FactoryBot.define do
  factory :recipe do
    title {Faker::Lorem.sentence}
    details {Faker::Lorem.sentence}
    process {Faker::Lorem.sentence}
    status { 'released' }
    association :user 

    after(:build) do |recipe|
      recipe.main_image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end 
  end
end
