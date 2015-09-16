FactoryGirl.define do
  factory :resource do
    title "Lear Ruby on Rails the Hard Way"
    description Faker::Lorem.paragraph
    url Faker::Internet.url
  end
end
