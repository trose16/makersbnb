require 'spec_helper'

RSpec.feature 'Creating a Listing', :type => :feature do

	include WebHelpers

	scenario 'user can visit page to add a new listing' do
		visit '/listings/new'
		expect(page.status_code).to eq 200
	end

	scenario 'user should be able to fill in a form' do
		create_listing
		expect(page.status_code).to eq 200
		expect(page).to have_current_path('/listings')
		expect(page).to have_content("Peacock Paradise Private Villa")
		expect{create_listing}.to change{Listing.count}.by(1)
	end

	scenario 'user should not be able to submit incomplete listing' do
		expect{create_incomplete_listing}.not_to change{Listing.count}
	end

end
