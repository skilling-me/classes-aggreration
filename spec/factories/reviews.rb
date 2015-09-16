FactoryGirl.define do
  factory :review do
    comment "This is a super comment to review"
    sequence(:rating) { rand(0..5)}
    association :resource
    association :user
  end
end
