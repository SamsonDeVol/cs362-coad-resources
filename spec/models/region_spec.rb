require 'rails_helper'

RSpec.describe Region, type: :model do
    it "exists" do
        Region.new
    end

    describe "associations" do 
      it "has many tickets" do 
        expect(Region.new).to have_many(:tickets)
      end
    end

end
