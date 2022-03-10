require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do
    scenario "is successful" do
        admin_user = create(:admin_user)
        admin_user.confirm
        log_in_as(admin_user)
        ticket = create(:ticket)
        visit "/tickets/#{ticket.id}"
        expect(page).to have_text "#{ticket.name}"
        click_on 'Delete'
        expect(page).to have_text "Ticket #{ticket.id} was deleted."
    end
end
