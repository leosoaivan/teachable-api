# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    # Associations

    # Attributes
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }

    factory :user_with_gradebooks do
      transient do
        gradebooks_count { 5 }
      end

      after(:create) do |user, evaluator|
        create_list(:gradebook, evaluator.gradebooks_count, user: user)
      end
    end
  end
end
