require 'spec_helper'

feature 'Requesting a listing' do

include WebHelpers

  describe "when logged in" do

    scenario "user can request a property" do
      pending "requesting a property"
      sign_up_owner
      log_in_owner
      create_listing
      log_out
      sign_up_renter
      log_in_renter
      click_link('Peacock Paradise Private Villa')
      click_button 'Request'
      expect(current_path).to eq "/users/requests"
    end

    scenario "user can see a request button" do
      sign_up_owner
      log_in_owner
      create_listing
      log_out
      sign_up_renter
      log_in_renter
      click_link('Peacock Paradise Private Villa')
      expect(page).to have_selector(:link_or_button, 'Request')
    end

    scenario "Saves requests to the database" do
      pending "adding to databse"
      expect{make_request}.to change{Booking.count}.by(1)
    end

  end

  describe "when not logged in" do
    scenario "user cannot see a request button" do
      sign_up_owner
      log_in_owner
      create_listing
      log_out
      visit("/listings")
      click_link('Peacock Paradise Private Villa')
      expect(page).not_to have_selector(:link_or_button, 'Request')
    end

  end



end
