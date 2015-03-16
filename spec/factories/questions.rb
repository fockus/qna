FactoryGirl.define do
  factory :question do
    title { Faker::Hacker.say_something_smart }
    body { Faker::Lorem.paragraph }

    factory :invalid_question, class: "Question" do
      title nil
      body nil
    end
  end
end