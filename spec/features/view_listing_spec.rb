require 'spec_helper'

RSpec.feature 'Viewing a individial listing', :type => :feature do

  include WebHelpers

  scenario 'user can visit page to see a listing' do
    create_listing
    visit("/listings")
    click_link "Peacock Paradise Private Villa"
    expect(page.status_code).to eq 200
    expect(page).to have_content("My home has peacocks and a pool.")
    expect(page).to have_content("50")
    expect(page).to have_content("London")
    expect(page).to have_content("United Kingdom")
  end

end
