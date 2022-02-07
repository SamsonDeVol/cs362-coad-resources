FactoryBot.define do 
  factory :user do
    email { "fake@email.com" }
    role { 1 }
  end
end