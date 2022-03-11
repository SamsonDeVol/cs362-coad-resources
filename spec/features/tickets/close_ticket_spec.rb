require 'rails_helper'

RSpec.describe 'Closing a ticket', type: :feature do
    scenario "is successful" do
        organization_user = create(:user)
        organization_user.confirm
        organization_user.organization.approve
        organization_user.organization.save!
        log_in_as(organization_user)
        ticket = create(:ticket)
        ticket.organization = organization_user.organization
        ticket.save!
        visit "/tickets/#{ticket.id}"
        expect(page).to have_text "#{organization_user.organization.name}"
        click_on 'Release'
        visit "/tickets/#{ticket.id}"
        expect(page).to have_text "Capture"
        expect(page).to_not have_text "#{organization_user.organization.name}"
    end
end
