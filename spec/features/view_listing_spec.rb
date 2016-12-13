require 'spec_helper'

RSpec.feature 'Viewing a individial listing', :type => :feature do

  include WebHelpers

  scenario 'user can visit page to see a listing' do
    create_listing
    click_link "Peacock Paradise Private Villa"
    expect(page.status_code).to eq 200
    expect(page).to have_content("My home has peacocks and a pool.")
  end

end
