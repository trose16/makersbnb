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
	    end
	end
end