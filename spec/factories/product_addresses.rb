FactoryBot.define do
  factory :product_address do
    postal_code        { '123-4567' }
    shipping_area_id   { 2 }
    municipality       { '横浜市緑区' }
    address            { '111' }
    phone_number       { '00000000000' }
    token              { 'aaaa' }
    building_name      {}
    association :user
    association :sell
  end
end
