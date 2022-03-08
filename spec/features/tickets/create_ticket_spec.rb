require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do

    scenario "with valid attributes succeeds" do
        region = create(:region)
        resource_cat = create(:resource_category)
        visit '/tickets/new'
        fill_in 'Full Name', with: "Fake Name"
        fill_in 'Phone Number', with: "555 555 5555"
        select region.name, from: 'Region'
        select resource_cat.name, from: 'Resource Category'
        fill_in('Description', with: 'Fake')
        click_on 'Send this help request'
        expect(page).to have_text "Ticket Submitted"
        expect(page).to have_text "Thank you for submitting"
    end

    scenario "with invalid attributes succeeds" do
        region = create(:region)
        resource_cat = create(:resource_category)
        visit '/tickets/new'
        fill_in 'Full Name', with: "Fake Name"
        fill_in 'Phone Number', with: "555 555 555m"
        select region.name, from: 'Region'
        select resource_cat.name, from: 'Resource Category'
        fill_in('Description', with: 'Fake')
        click_on 'Send this help request'
        expect(page).to have_text "error prohibited this ticket"
    end
end
