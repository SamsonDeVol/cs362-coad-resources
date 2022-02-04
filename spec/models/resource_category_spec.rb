require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
    
    let (:resource_category) { build(:resource_category)}

    describe "attributes" do
      it "has a name" do
          expect(resource_category).to respond_to(:name)
      end

      it "has a boolean, active" do
          expect(resource_category).to respond_to(:active)
      end
    end
    
    describe "associations" do
      it "has and belongs to many organizations" do
        expect(resource_category).to have_and_belong_to_many(:organizations)
      end

      it "has many tickets" do
        expect(resource_category).to have_many(:tickets)
      end
    end

    describe "validations" do
      it "cannot have a blank name" do
        expect(resource_category).to be_valid
        resource_category.name = nil
        expect(resource_category).to_not be_valid
      end

      it "cannot have a name longer than 255 chars" do
        expect(resource_category).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
      end

      it "must have a unique name" do
        expect(resource_category).to validate_uniqueness_of(:name).case_insensitive  
      end
    end

    describe "#activate" do
      it "must set active value to true" do
        resource_category.active = false
        resource_category.activate
        expect(resource_category.active).to eq(true)
      end
    end

    describe "#deactivate" do
      it "must set active value to false" do
        resource_category.active = true
        resource_category.deactivate
        expect(resource_category.active).to eq(false)
      end
    end

    describe "#inactive?" do
      it "must return true if inactive" do
        resource_category.active = false
        expect(resource_category.inactive?).to eq(true)
      end

      it "must return false if active" do
        resource_category.active = true
        expect(resource_category.inactive?).to eq(false)
      end
    end

    describe "#to_s" do
      it "must return the name" do
        expect(resource_category.to_s).to eq(resource_category.name)
      end
    end

    describe "::unspecified" do
      it "must return a ResourceCategory with the name 'Unspecified'" do
        resource_category = ResourceCategory.unspecified
        expect(resource_category.name).to eq("Unspecified")
      end
    end
    
    describe "#active" do
      it "returns list of active Resource Categories" do
        inactive_cat = create(:not_active)
        active_ResourceCats = ResourceCategory.active
        expect(active_ResourceCats.any?).to be_falsey
        active_cat = create(:resource_category) 
        expect(active_ResourceCats.any?).to be_truthy 
      end
    end

    describe "#inactive" do 
      it "returns list of inactive Resource Categories" do
        active_cat = create(:resource_category) 
        active_ResourceCats = ResourceCategory.inactive
        expect(active_ResourceCats.any?).to be_falsey
        inactive_cat = create(:not_active)
        expect(active_ResourceCats.any?).to be_truthy
      end 
    end
end
