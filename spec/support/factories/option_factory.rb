FactoryGirl.define do
  factory :option do
    content Faker::Team.name
    question
  end
end