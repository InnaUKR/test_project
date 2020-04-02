FactoryBot.define do
  factory :excavator do
    company_name { Faker::Company.name }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    zip { Faker::Address.zip }
    crew_onsite { true }
    association :ticket
  end
end
