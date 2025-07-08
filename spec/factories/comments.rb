FactoryBot.define do
  factory :comment do
    comment_box       {Faker::Lorem.sentence}

    association :user
    association :story
  end
end