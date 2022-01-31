require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

    describe "attributes" do
        it "has a name" do
            expect(ResourceCategory.new).to respond_to(:name)
        end

        it "has a boolean, active" do
            expect(ResourceCategory.new).to respond_to(:active)
        end
      end
    
    describe "associations" do
        it "has and belongs to many organizations" do
            expect(ResourceCategory.new).to have_and_belong_to_many(:organizations)
        end
    end
end
