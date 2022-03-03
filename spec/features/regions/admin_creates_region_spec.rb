require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do

    scenario "with valid attributes suceeds" do
        admin_user = create(:user)
        admin_user.confirm
        admin_user.role = 'admin'
        admin_user.save!
        log_in_as(admin_user)
        visit '/regions/new'
        fill_in 'Name', with: "Fake New Region"
        click_on 'Add Region'
        expect(page).to have_text "Region successfully created"
        expect(page).to have_text "Fake New Region"
    end

    scenario "with invalid attribtes shows an error message" do 
        admin_user = create(:user)
        admin_user.confirm
        admin_user.role = 'admin'
        admin_user.save!
        log_in_as(admin_user)
        visit '/regions/new'
        fill_in 'Name', with: ''
        click_on 'Add Region'
        expect(page).to have_text 'errors prohibited this region'
    end
end
