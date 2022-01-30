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
      expect(organization).to respond_to(:name)
    end

    it "has a status" do
      expect(organization).to respond_to(:status)
    end

    it "has a phone" do
      expect(organization).to respond_to(:phone)
    end

    it "has an email" do
      expect(organization).to respond_to(:email)
    end

    it "has a description" do
      expect(organization).to respond_to(:description)
    end

    it "has a rejection_reason" do
      expect(organization).to respond_to(:rejection_reason)
    end

    it "has a liability_insurance" do
      expect(organization).to respond_to(:liability_insurance)
    end

    it "has a primary_name" do
      expect(organization).to respond_to(:primary_name)
    end

    it "has a secondary_name" do
      expect(organization).to respond_to(:secondary_name)
    end

    it "has secondary_phone" do  
      expect(organization).to respond_to(:secondary_phone)
    end

    it "has a title" do
      expect(organization).to respond_to(:title)
    end

    it "has transportation" do 
      expect(organization).to respond_to(:transportation)
    end

    it "has agreements one through eight" do
      expect(organization).to respond_to(:agreement_one)
      expect(organization).to respond_to(:agreement_two)
      expect(organization).to respond_to(:agreement_three)
      expect(organization).to respond_to(:agreement_four)
      expect(organization).to respond_to(:agreement_five)
      expect(organization).to respond_to(:agreement_six)
      expect(organization).to respond_to(:agreement_seven)
      expect(organization).to respond_to(:agreement_eight)
    end
  end

  describe "associations" do
    it "has many users" do
      expect(organization).to have_many(:users)
    end
    
    it "has many tickets" do
      expect(organization).to have_many(:tickets)
    end

    it "has and belongs to many resource categories" do 
      expect(organization).to have_and_belong_to_many(:resource_categories)
    end
  end

  describe "#to_s" do
    it "returns the name" do
      expect(organization.to_s).to eq(organization.name)
    end
  end

  describe "#approve" do
    it "sets status to approved" do
    organization.status = "rejected"
    expect(organization.status).to eq("rejected")
    organization.approve
    expect(organization.status).to eq("approved")
    end
  end

  describe "validations" do
    it "is invalid without an email" do
      expect(organization).to validate_presence_of(:email)
    end

    it "is invalid without a name" do
      expect(organization).to validate_presence_of(:name)
    end

    it "is invalid without a phone" do
      expect(organization).to validate_presence_of(:phone)
    end

    it "is invalid without a status" do
      expect(organization).to validate_presence_of(:status)
    end

    it "is invalid without a primary name" do
      expect(organization).to validate_presence_of(:primary_name)
    end

    it "is invalid without a secondary name" do
      expect(organization).to validate_presence_of(:secondary_name)
    end

    it "is invalid without a secondary phone" do
      expect(organization).to validate_presence_of(:secondary_phone)
    end

    it "cannot have an email longer than 255 chars" do
      expect(organization).to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
    end

    it "cannot have an invalid email format" do
      expect(organization).to allow_value('fake@email.com').for(:email).on(:create)
      expect(organization).to_not allow_value('fakeemail.com').for(:email).on(:create)
    end

    it "cannot have a non unique email" do 
      expect(organization).to validate_uniqueness_of(:email).case_insensitive
    end

    it "cannot have an name longer than 255 chars" do
      expect(organization).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end

    it "cannot have a non unique name" do 
      expect(organization).to validate_uniqueness_of(:name).case_insensitive
    end

    it "cannot have an description longer than 1020 chars" do
      expect(organization).to validate_length_of(:description).is_at_most(1020).on(:create)
    end
  end
end
