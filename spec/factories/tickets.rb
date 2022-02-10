FactoryBot.define do 
  factory :ticket do
    name { "fake name" }
    description { "fake description" }
    phone { "15555555555" }
    closed { false }
    resource_category 
    region
    organization { nil }
  end
end