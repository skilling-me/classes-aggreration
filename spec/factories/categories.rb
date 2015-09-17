FactoryGirl.define do
  factory :category do
    title { Faker::Lorem.sentence(2) }
    slug { Faker::Internet.slug }
  end

  factory :categorisation do
    association :category
    association :resource
  end

end
