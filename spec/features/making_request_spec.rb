require 'spec_helper'

feature 'Requesting a listing' do

include WebHelpers

  scenario "user can request a property" do
    sign_up
    create_listing
    click_link('Peacock Paradise Private Villa')
    expect(page).to have_selector(:link_or_button, 'Request')
    click_button "Request"
    expect(current_path).to eq "/request/new"
    expect(page).to have_selector(:link_or_button,'Send Request')
    expect(page).to have_content("Peacock Paradise Private Villa")
    expect(page).to have_content( "My home has peacocks and a pool.")
  end

end
