require 'rails_helper'

RSpec.describe Ticket, type: :model do

  let (:ticket) { build_stubbed(:ticket) }

  describe "attributes" do
    it "has a name" do
      expect(ticket).to respond_to(:name)
    end

    it "has a description" do
      expect(ticket).to respond_to(:description)
    end

    it "has a phone" do
      expect(ticket).to respond_to(:phone)
    end

    it "has a boolean, closed" do
      expect(ticket).to respond_to(:closed)
    end
  end

  describe "attributes" do
    it "belongs to a region" do
      expect(ticket).to belong_to(:region)
    end
    
    it "belongs to a resource category" do
      expect(ticket).to belong_to(:resource_category)
    end
  end
end
