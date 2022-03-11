require 'rails_helper'

RSpec.describe 'Capturing a ticket', type: :feature do
    scenario "is successful" do
        organization_user = create(:user)
        organization_user.confirm
        organization_user.organization.approve
        organization_user.organization.save!
        log_in_as(organization_user)
        ticket = create(:ticket)
        visit "/tickets/#{ticket.id}"
        expect(page).to have_text "#{ticket.name}"
        click_on 'Capture'
        visit "/tickets/#{ticket.id}"
        expect(page).to have_text "#{organization_user.organization.name}"
        expect(page).to have_text "Release"
    end
end
