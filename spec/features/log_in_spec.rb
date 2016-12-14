require 'spec_helper'

RSpec.feature 'Log in', :type => :feature do

include WebHelpers

  scenario 'Logging in with correct creds takes you to listings page' do
    sign_up
    correct_log_in
    expect(page).to have_content 'Listings'
  end

  scenario 'Logging in with incorrect creds does not take you to listings page' do
    sign_up
    incorrect_log_in
    expect(page).not_to have_content 'Listings'
  end

  scenario 'When logged out. The log in page, should have buttons for log in or log out' do
    sign_up
    visit("/sessions/new")
    expect(page).not_to have_button("Log out")
     
  end

end
