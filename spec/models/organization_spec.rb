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

    it "has a primary_name" do
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

    it "has agreements one through eight" do
      organization.should respond_to(:agreement_one)
      organization.should respond_to(:agreement_two)
      organization.should respond_to(:agreement_three)
      organization.should respond_to(:agreement_four)
      organization.should respond_to(:agreement_five)
      organization.should respond_to(:agreement_six)
      organization.should respond_to(:agreement_seven)
      organization.should respond_to(:agreement_eight)
    end
  end

  describe "associations" do
    it "has many users" do
      organization.should have_many(:users)
    end
    
    it "has many tickets" do
      organization.should have_many(:tickets)
    end

    it "has and belongs to many resource categories" do 
      organization.should have_and_belong_to_many(:resource_categories)
    end
  end

  describe "validations" do
    it "is invalid without an email" do
      organization.should validate_presence_of(:email)
    end

    it "is invalid without a name" do
      organization.should validate_presence_of(:name)
    end

    it "is invalid without a phone" do
      organization.should validate_presence_of(:phone)
    end

    it "is invalid without a status" do
      organization.should validate_presence_of(:status)
    end

    it "is invalid without a primary name" do
      organization.should validate_presence_of(:primary_name)
    end

    it "is invalid without a secondary name" do
      organization.should validate_presence_of(:secondary_name)
    end

    it "is invalid without a secondary phone" do
      organization.should validate_presence_of(:secondary_phone)
    end

    it "cannot have an email longer than 255 chars" do
      organization.should validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
    end

    it "cannot have an invalid email format" do
      organization.should allow_value('fake@email.com').for(:email).on(:create)
      organization.should_not allow_value('fakeemail.com').for(:email).on(:create)
    end

    it "cannot have a non unique email" do 
      organization.should validate_uniqueness_of(:email).case_insensitive
    end

    it "cannot have an name longer than 255 chars" do
      organization.should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end
  end
end
