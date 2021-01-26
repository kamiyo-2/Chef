FactoryBot.define do
  factory :recipephoto do
    text                  {"作り方"}
    association :recipe
    after(:build) do |recipephoto|
      recipephoto.sub_image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end 
  end
end
