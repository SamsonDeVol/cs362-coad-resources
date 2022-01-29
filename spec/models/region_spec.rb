require 'rails_helper'

RSpec.describe Region, type: :model do

    describe "attributes" do
      it "has a name" do
          Region.new.should respond_to(:name)
      end
    end

    describe "associations" do 
      it "has many tickets" do 
        Region.new.should have_many(:tickets)
      end
    end

    describe "#to_s" do
      it "returns the name" do
        name = "Deschutes"
      region = Region.new(name: name)
      region.to_s.should eq(name)
      end
    end

    describe "::unspecified" do
      it "returns a Region with the name 'Unspecified'" do
        region = Region.unspecified
        region.name.should eq('Unspecified')
      end
    end

    describe "validations" do
      it "cannot have a blank name" do
        region = Region.new(name: 'The Dogg Pound')
        region.should be_valid
        region = Region.new(name: nil)
        region.should_not be_valid
      end

      it "cannot have a name longer than 255 chars" do
        Region.new.should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
      end    

      it "must have a unique name" do
        duplicate_name = "Dogg Pound"
        region = Region.create!(name: duplicate_name)
        duplicate_region = Region.new(name: "Kurupt")
        duplicate_region.should be_valid
        duplicate_region.name = duplicate_name
        duplicate_region.should_not be_valid    
      end
      
    end
end
