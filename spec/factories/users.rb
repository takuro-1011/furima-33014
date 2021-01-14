FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'test00' }
    password_confirmation { 'test00' }
    first_name           { '山田' }
    last_name            { '太郎' }
    first_name_kana      { 'ヤマダ' }
    last_name_kana       { 'タロウ' }
    birthday             { '1991-06-11' }
  end
end
