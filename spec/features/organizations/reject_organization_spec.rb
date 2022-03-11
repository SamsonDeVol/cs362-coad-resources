require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do
  
  scenario "admin rejects successfully" do
    admin_user = create(:admin_user)
    admin_user.confirm
    log_in_as(admin_user)
    organization = create(:organization)
    visit "/organizations/#{organization.id}"
    click_on "Reject"
    expect(page).to have_text "has been rejected"
    click_on "rejected-tab"
    expect(page).to have_text "#{organization.name}"
  end
end
