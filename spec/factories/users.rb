FactoryBot.define do 
  factory :user do
    sequence(:email) { |n| "person#{n}@email.com" }
    password { "fakepassword" }
    role { "organization" }
    organization

    factory :admin_user do
      role { "admin" }
    end
  end
end