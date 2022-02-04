FactoryBot.define do 
  factory :ticket do
    name { "fake name" }
    description { "fake description" }
    phone { "1234567890" }
    organization_id { 1 }
    resource_category_id { 2 }
    region_id { 3 }
  end
end