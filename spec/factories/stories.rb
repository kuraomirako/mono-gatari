FactoryBot.define do
  factory :story do
    title       {Faker::Book.title}
    body        { Faker::Lorem.paragraph_by_chars(number: rand(300..1000)) }
    category_id { rand(2..3) }
    genre_id    { rand(2..7) }

    association :user
  end
end