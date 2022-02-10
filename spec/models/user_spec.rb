require 'rails_helper'

RSpec.describe User, type: :model do

  let (:user) { build_stubbed(:user)}

  describe "attributes" do
    it "has an email" do
      expect(user).to respond_to(:email)
    end
    
    it "has a role" do 
      expect(user).to respond_to(:role)
    end
  end

  describe "associations" do
    it "belongs to an organization" do
      expect(user).to belong_to(:organization)
    end
  end

  describe "validations" do
    it "has an email" do
      expect(user).to validate_presence_of(:email)
    end

    it "has an email under 255 chars" do
      expect(user).to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
    end

    it "has a valid email format" do
      expect(user).to allow_value('fake@email.com').for(:email).on(:create)
      expect(user).to_not allow_value('fakeemail.com').for(:email).on(:create)
    end

    it "has a unique email" do
      user = User.new(email: "unique@email.com")
      expect(user).to validate_uniqueness_of(:email).case_insensitive
    end
  end
end
