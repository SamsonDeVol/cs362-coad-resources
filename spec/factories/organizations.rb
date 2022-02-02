FactoryBot.define do 
  factory :organization do
    name { "fake name" }
    status { 1 } 
    phone { "1111111111" }
    email { 'fake@email.com' }
    description { "describe it" }
    rejection_reason { "reason" }
    liability_insurance { false }
    primary_name { "prime_name" }
    secondary_name { "sec_name" }
    secondary_phone { "2222222222" }
    title { "atitle" }
    transportation { 1 }
  end
end