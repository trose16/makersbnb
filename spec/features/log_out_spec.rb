require 'spec_helper'

feature 'logging out' do

include WebHelpers

  scenario 'a logged in user logs out' do
    sign_up
    click_button('Log out')
    expect(page.status_code).to eq 200
    expect(page).to have_selector(:link_or_button, 'Log in')
  end

end
