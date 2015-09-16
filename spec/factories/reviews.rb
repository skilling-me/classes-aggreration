FactoryGirl.define do
  factory :review do
    comment "This is a super comment to review"
    rating rand(0..5)
  end
end
