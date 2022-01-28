require 'rails_helper'

RSpec.describe Organization, type: :model do

  let (:organization) {
    Organization.new(name: "fake name",
      status: 1, 
      phone: "1111111111",
      email: 'fake@email.com',
      description: "describe it",
      rejection_reason: "reason",
      liability_insurance: false,
      primary_name: "prime_name",
      secondary_name: "sec_name",
      secondary_phone: "2222222222",
      title: "atitle",
      transportation: 1)
  }

  it "exists" do 
    Organization.new
  end

  describe "attributes" do

    it "has a name" do
      organization.should respond_to(:name)
    end

    it "has transportation" do 
      organization.should respond_to(:transportation)
    end

    it "has a title" do
      organization.should respond_to(:title)
    end

    it "has secondary_phone" do 
      organization.should respond_to(:secondary_phone)
    end
  end
end
