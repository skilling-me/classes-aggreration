FactoryGirl.define do
  factory :category do
    title Faker::Lorem.sentence(2)
    slug Faker::Internet.slug
  end
end
