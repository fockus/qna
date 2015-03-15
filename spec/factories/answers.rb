FactoryGirl.define do
  factory :answer do
    comment { Faker::Lorem.paragraph }

    factory :invalid_answer do
      title nil
    end
  end
end

