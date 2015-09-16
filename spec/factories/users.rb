FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Doe"
    #email { Faker::Internet.safe_email }
    sequence(:email) { |n| "johndoe#{n}@example.com"}
    password { Faker::Internet.password }
  end
end
