FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6) + '1a'}
    password_confirmation {password}
    last_name             { '山田' }
    first_name            { '太郎' }
    birthday              { Faker::Date.between(from: '1905-01-01', to: '2023-12-31') }
  end
end