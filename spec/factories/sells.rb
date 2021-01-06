FactoryBot.define do
  factory :sell do
    product_name         { '名前' }
    product_description  { '説明' }
    image                { Faker::Lorem.sentence }
    price                { 1000 }
    category_id          { 2 }
    product_condition_id { 2 }
    delivery_fee_id      { 2 }
    shipping_area_id     { 2 }
    day_id               { 2 }
    association :user

    after(:build) do |sell|
      sell.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
