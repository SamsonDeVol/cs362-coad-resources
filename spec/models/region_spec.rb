require 'rails_helper'

RSpec.describe Region, type: :model do

  let (:region) { build_stubbed(:region) }

  describe "attributes" do
    it "has a name" do
        expect(region).to respond_to(:name)
    end
  end

  describe "associations" do 
    it "has many tickets" do 
      expect(region).to have_many(:tickets)
    end
  end

  describe "#to_s" do
    it "returns the name" do
    expect(region.to_s).to eq(region.name)
    end
  end

  describe "::unspecified" do
    it "returns a Region with the name 'Unspecified'" do
      region = Region.unspecified
      expect(region.name).to eq('Unspecified')
    end
  end

  describe "validations" do
    it "cannot have a blank name" do
      expect(region).to be_valid
      region.name = nil
      expect(region).to_not be_valid
    end

    it "cannot have a name longer than 255 chars" do
      expect(region).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end    

    it "must have a unique name" do
      duplicate_name = "Dogg Pound"
      region = Region.create!(name: duplicate_name)
      duplicate_region = Region.new(name: "Kurupt")
      expect(duplicate_region).to be_valid
      duplicate_region.name = duplicate_name
      expect(duplicate_region).to_not be_valid    
    end
  end
end
