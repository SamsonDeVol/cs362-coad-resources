require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

    describe "attributes" do
        it "has a name" do
            expect(ResourceCategory.new).to respond_to(:name)
        end
      end
end
