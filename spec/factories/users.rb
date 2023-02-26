FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'Password123?' }
    
    trait :confirmed do
      email_confirmed { true }
      email_confirmed_at { 1.day.ago }
    end
  end
end
