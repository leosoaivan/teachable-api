FactoryBot.define do
  factory :user do
    email { "test@test.test" }
    password { "password" }
    password_confirmation { "password" }
  end
end