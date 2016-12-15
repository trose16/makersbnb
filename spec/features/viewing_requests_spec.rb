require 'spec_helper'

feature 'Viewing requets' do

include WebHelpers

	describe "renter requests" do

	    scenario "user can view the requests they have made" do
	    	make_request
	    	expect(page).to have_content("Peacock Paradise Private Villa")
	    end
	end
end