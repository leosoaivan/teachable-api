FactoryBot.define do
  factory :gradebook do
    association :user

    subject { Faker::Educator.course_name }
  end
end
