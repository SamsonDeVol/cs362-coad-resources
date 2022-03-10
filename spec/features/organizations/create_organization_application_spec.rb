require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do

  scenario "with valid attributes is successful" do
    new_user = create(:user)
    new_user.organization = nil
    new_user.confirm
    # admin user needed for email sent when click_on 'Apply'
    admin_user = create(:admin_user)
    admin_user.confirm
    log_in_as(new_user)
    visit '/new_organization_application'
    choose 'organization_liability_insurance_true'
    choose 'organization_agreement_one_true'
    choose 'organization_agreement_two_true'
    choose 'organization_agreement_three_true'
    choose 'organization_agreement_four_true'
    choose 'organization_agreement_five_true'
    choose 'organization_agreement_six_true'
    choose 'organization_agreement_seven_true'
    choose 'organization_agreement_eight_true'
    fill_in 'What is your name? (Last, First)', with: 'Fake, Name'
    fill_in 'Organization Name', with: 'FakeOrg'
    fill_in 'What is your title? (if applicable)', with: 'Fake Title'
    fill_in 'What is your direct phone number? Cell phone is best.', with: '11111111111'
    fill_in "Who may we contact regarding your organization's application if we are unable to reach you?", with: 'Fake Mom 1'
    fill_in 'What is a good secondary phone number we may reach your organization at?', with: '222222222222'
    fill_in "What is your Organization's email?", with: 'fakeorganizationemail@email.com'
    choose 'organization_transportation_yes'
    click_on 'Apply'
    expect(page).to have_text 'Application Submitted'
  end

  scenario "with invalid attributes shows an error message" do
    new_user = create(:user)
    new_user.organization = nil
    new_user.confirm
    # admin user needed for email sent when click_on 'Apply'
    admin_user = create(:admin_user)
    admin_user.confirm
    log_in_as(new_user)
    visit '/new_organization_application'
    choose 'organization_liability_insurance_true'
    click_on 'Apply'
    expect(page).to have_text "Email can't be blank"
  end
end
