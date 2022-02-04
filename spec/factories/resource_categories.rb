FactoryBot.define do 
  factory :resource_category do
    name { "fake name" }

    factory :not_active do
      name { "fake inactive name" }
      active { false }
    end

    factory :unspecified do
    end
  end
end