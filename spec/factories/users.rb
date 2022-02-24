FactoryBot.define do 
  factory :user do
    sequence(:email) { |n| "person#{n}@email.com" }
    password { "fakepassword" }
    role { "organization" }
  end
end