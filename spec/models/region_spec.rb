require 'rails_helper'

RSpec.describe Region, type: :model do
    it "exists" do
        Region.new
    end

    describe "attributes" do
      it "has a name" do
          region = Region.new
          expect(region).to respond_to(:name)
      end
    end

    describe "associations" do 
      it "has many tickets" do 
        expect(Region.new).to have_many(:tickets)
      end
    end

    describe "#to_s" do
      it "returns the name" do
        name = "Deschutes"
      region = Region.new(name: name)
      expect(region.to_s).to eq(name)
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
        region = Region.new(name: 'The Dogg Pound')
        expect(region).to be_valid
        region = Region.new(name: nil)
        expect(region).to_not be_valid
      end
    end
end
