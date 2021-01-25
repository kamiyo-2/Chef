FactoryBot.define do
  factory :tag do
    name {Faker::Lorem.sentence}

    after(:build) do |tag|
      tag.tag_image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end 
  end
end
