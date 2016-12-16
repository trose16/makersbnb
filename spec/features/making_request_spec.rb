require 'spec_helper'

feature 'Requesting a listing' do

include WebHelpers

  describe "when logged in" do

    scenario "user can request a property" do
      make_request
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

    scenario "Saves requests to the database when the listing is available" do
      expect{make_request}.to change{Booking.count}.by(1)
    end

    scenario "does not save requests to the database when the listing is unavailable" do
      expect{make_unavailable_request}.to change{Booking.count}.by(0)
    end

    scenario "does not save requests to the database after someone has booked the dates already" do
      make_request
      log_out
      log_in_owner
      visit "/users/requests"
      click_button "Confirm"
      log_out
      expect{make_second_request}.to change{Booking.count}.by(0)
      expect(page).to have_content("Sorry, the dates are not available.")
    end

    scenario "user cannot request their own properties" do
      sign_up_owner
      log_in_owner
      create_listing
      click_link('Peacock Paradise Private Villa')
      fill_in "book_from", with: "2016-01-03"
      fill_in "book_to", with: "2016-01-07"
      click_button 'Request'
      expect(page).to have_content("You cannot book a property you own.")  
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
