require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do

    describe "create new region" do
        before :each do
            admin_user = create(:user)
            admin_user.confirm
            admin_user.role = 'admin'
            admin_user.save!
            log_in_as(admin_user)
        end
        it "create new region as admin" do
            visit '/regions/new'
            fill_in 'Name', with: "Fake New Region"
            click_on 'Add Region'
            expect(page).to have_text "Region successfully created"
            expect(page).to have_text "Fake New Region"
        end
    end


end
