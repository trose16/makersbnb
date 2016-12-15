require 'spec_helper'

feature 'Confirming requets' do

include WebHelpers

	describe "confirm" do

	    scenario "user can confirm a request made on their listing" do
			make_request
			log_out
			log_in_owner
			visit '/users/requests'
			click_button('Confirm')
			expect(page).to have_content('Request has been confirmed')
	    end

	    scenario "user can see bookings they have confirmed" do
			make_request
			log_out
			log_in_owner
			visit '/users/requests'
			click_button('Confirm')
			click_link('Go back to my requests')
			expect(page).to have_content('Booking has been accepted')
	    end

	end

	describe "deny" do

	    scenario "user can deny a request made on their listing" do
			make_request
			log_out
			log_in_owner
			visit '/users/requests'
			click_button('Deny')
			expect(page).to have_content('Request has been denied')
		end

	end
end