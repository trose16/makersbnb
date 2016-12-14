require 'spec_helper'

feature "seeing your listings" do
  include WebHelpers
  scenario "user can view his own listings" do
    sign_up_owner
    log_in_owner
    create_listing
    expect(page).to have_content('Peacock Paradise Private Villa')
    expect(current_path).to eq("/listings")

  end
end
