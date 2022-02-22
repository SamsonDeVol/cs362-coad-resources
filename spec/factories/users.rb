FactoryBot.define do 
  factory :user do
    email { "fake@email.com" }
    password { "fakepassword" }
    role { 1 }
  end
end