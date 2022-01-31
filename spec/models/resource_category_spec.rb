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
end
