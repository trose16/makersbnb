require 'spec_helper'

feature 'Requesting a listing' do

include WebHelpers

  scenario "user can request a property" do
    sign_up
    create_listing
    click_link('Peacock Paradise Private Villa')
    expect(page).to have_selector(:link_or_button, 'Send Request')
    click_button 'Send Request'
    expect(current_path).to eq "/users/requests"
  end

  scenario "Saves requests to the database" do
    expect{make_request}.to change{Request.count}.by(1)
  end

end
