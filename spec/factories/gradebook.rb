FactoryBot.define do
  factory :gradebook do
    # Associations
    user

    # Attributes
    title { Faker::Educator.course_name }
  end
end
