require 'spec_helper'

RSpec.feature 'Creating a Listing', :type => :feature do

	include WebHelpers

	scenario 'user can visit page to add a new listing' do
		visit '/listings/new'
		expect(page.status_code).to eq 200
	end

	scenario 'user should be able to fill in a form' do
		sign_up_owner
		log_in_owner
		create_listing
		visit("/listings")
		expect(page.status_code).to eq 200
		expect(page).to have_content("Peacock Paradise Private Villa")
	end

	scenario 'user should not be able to submit incomplete listing' do
		sign_up_owner
		log_in_owner
		expect{create_listing(description: "", location_city: "")}.not_to change{Listing.count}
	end

end
