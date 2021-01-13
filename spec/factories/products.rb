FactoryBot.define do
  factory :product do
    image                { Faker::Lorem.sentence }
    postal_code        { 123-4567 }
    shipping_area_id   { 2 }
    municipality       { "横浜市緑区" }
    address            { "#{青山}1-1-1" }
    phone_number       { 00000000000 }

    after(:build) do |sell|
      sell.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end