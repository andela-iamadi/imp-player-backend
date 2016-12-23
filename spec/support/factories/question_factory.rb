FactoryGirl.define do
  factory :question do
    content Faker::Team.name


    trait :with_options do
      ignore { number_of_options 3 }

      after(:create) do |question, evaluator|
        options = create_list(:option, evaluator.number_of_options, question_id: question.id)
        create(:correct_option, question_id: question.id, option_id: options[0].id)
      end
    end
  end

end

