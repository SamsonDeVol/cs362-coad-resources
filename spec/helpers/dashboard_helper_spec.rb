require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DashboardHelper. For example:
#
# describe DashboardHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DashboardHelper, type: :helper do

  let (:user) { create(:user) }

  describe "#dashboard_for" do
    it "sends admin user to admin dashboard" do
      admin_user = create(:admin_user)
      expect(dashboard_for(admin_user)).to eq('admin_dashboard')
    end
    it "sends submitted organization user to submitted organization dashboard" do
      puts(user.organization&.submitted?)
      expect(dashboard_for(user)).to eq('organization_submitted_dashboard')
    end
    it "sends approved organization user to approved organization dashboard" do
      user.organization.status = 0
      expect(dashboard_for(user)).to eq('organization_approved_dashboard')
    end
    it "sends non approved or submitted organization user to create application dashboard" do
      user.organization.status = 2
      expect(dashboard_for(user)).to eq('create_application_dashboard')
      user.organization.status = 3
      expect(dashboard_for(user)).to eq('create_application_dashboard')
    end
  end
end
