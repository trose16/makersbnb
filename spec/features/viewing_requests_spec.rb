require 'spec_helper'

feature 'Viewing requets' do

include WebHelpers

	describe "renter requests" do

	    scenario "user can view the requests they have made" do
	    	make_request
	    	expect(page).to have_content("Peacock Paradise Private Villa")
	    	expect(page).to have_content("Requested from: 2016-01-03")
	    	expect(page).to have_content("Requested until: 2016-01-07")
	    end

	    scenario "user can view listing details of a property they have requested" do
	    	make_request
	    	click_link("Peacock Paradise Private Villa")
	    	expect(page).to have_content("My home has peacocks and a pool.")
	    end

	end

	describe "owner requests" do

		scenario "owner can view requests made on their listing" do
			make_request
			log_out
			log_in_owner
			visit '/users/requests'
			expect(page).to have_content("Peacock Paradise Private Villa")
			expect(page).to have_content("Requested by: Sam")
		end

		scenario "owner can see when their property has been requested from and until" do
			make_request
			log_out
			log_in_owner
			visit '/users/requests'
			expect(page).to have_content("Requested from: 2016-01-03")
	    	expect(page).to have_content("Requested until: 2016-01-07")
		end

	end
end