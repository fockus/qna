FactoryGirl.define do
  factory :answer do
    comment { Faker::Lorem.paragraph }
    question

    factory :invalid_answer, class: 'Answer' do
      comment nil
      question nil
    end
  end
end
