require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do
    
  scenario "admin approves successfully" do
    admin_user = create(:admin_user)
    admin_user.confirm
    log_in_as(admin_user)
    organization = create(:organization)
    visit "/organizations/#{organization.id}"
    click_on "Approve"
    expect(page).to have_text "has been approved"
    click_on "approved-tab"
    expect(page).to have_text "#{organization.name}"
  end
end
