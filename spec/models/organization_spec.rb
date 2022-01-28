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

  describe "attributes" do
    it "has a name" do
      organization.should respond_to(:name)
    end

    it "has a status" do
      organization.should respond_to(:status)
    end

    it "has a phone" do
      organization.should respond_to(:phone)
    end

    it "has an email" do
      organization.should respond_to(:email)
    end

    it "has a description" do
      organization.should respond_to(:description)
    end

    it "has a rejection_reason" do
      organization.should respond_to(:rejection_reason)
    end

    it "has a liability_insurance" do
      organization.should respond_to(:liability_insurance)
    end

    it "has an primary_name" do
      organization.should respond_to(:primary_name)
    end

    it "has a secondary_name" do
      organization.should respond_to(:secondary_name)
    end

    it "has secondary_phone" do  
      organization.should respond_to(:secondary_phone)
    end

    it "has a title" do
      organization.should respond_to(:title)
    end

    it "has transportation" do 
      organization.should respond_to(:transportation)
    end
  end

  describe "associations" do
    it "has many users" do
      organization.should have_many(:users)
    end
    
    it "has many tickets" do
      organization.should have_many(:tickets)
    end
  end

end
