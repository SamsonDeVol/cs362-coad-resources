require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do

    scenario "is successful" do
      admin_user = create(:admin_user)
      admin_user.confirm
      log_in_as(admin_user)
      region = create(:region)
      visit "/regions/#{region.id}"
      expect(page).to have_text "#{region.name}"
      click_on 'Delete'
      expect(page).to have_text 'Unspecified'
    end
end
