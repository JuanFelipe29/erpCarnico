FactoryBot.define do
  factory :supplier do
    name { Faker::Company.name }
    nit { Faker::Company.duns_number }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
  end
end
