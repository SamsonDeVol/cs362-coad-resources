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
  end
end
