FactoryGirl.define do
  factory :question do
    title { Faker::Hacker.say_something_smart }
    body { Faker::Lorem.paragraph }

    factory :question_with_answers do
      transient do
        answers_count 5
      end

      after(:create) do |question, evaluator|
        create_list(:answer, evaluator.answers_count, question: question)
      end
    end

  end

  factory :invalid_question, class: 'Question' do
    title nil
    body nil
  end

end