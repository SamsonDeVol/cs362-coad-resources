require 'rails_helper'

RSpec.describe User, type: :model do

  let (:user) { build_stubbed(:user)}

  describe "attributes" do
    it "has an email" do
      expect(user).to respond_to(:email)
    end
  end
end
