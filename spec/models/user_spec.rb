require 'rails_helper'

RSpec.describe User, type: :model do

  let (:user) { build_stubbed(:user)}

  describe "attributes" do
    it "exists" do
      expect(user).to be_valid
    end
  end
end
