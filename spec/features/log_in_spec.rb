require 'spec_helper'

RSpec.feature 'Log in', :type => :feature do

include WebHelpers

  scenario 'Logging in with correct creds takes you to listings page' do
    sign_up_owner
    log_in_owner
    expect(page).to have_content 'Listings'
  end

  scenario 'Logging in with incorrect creds does not take you to listings page' do
    sign_up_owner
    log_in_owner(password: "abc")
    expect(page).not_to have_content 'Listings'
  end

  scenario 'There should not be a log out button on the log in page' do
    sign_up_owner
    visit("/sessions/new")
    expect(page).not_to have_button("Log out")

  end

end
