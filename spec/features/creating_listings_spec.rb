require 'spec_helper'

RSpec.feature 'Creating a Listing', :type => :feature do

	scenario 'user can visit page to add a new listing' do
		visit '/listings/new'
		expect(page.status_code).to eq 200
	end

	scenario 'user should be able to fill in a form' do
		visit '/listings/new'
		fill_in :name, with: "Peacock Paradise Private Villa"
		fill_in :description, with: "My home has peacocks and a pool."
		fill_in :price, with: "50"
		fill_in :available_from, with: "12/12/2016"
		fill_in :available_until, with: "22/04/2017"
		click_button "List my Property"

		expect(page.status_code).to eq 200
		expect(page).to have_current_path('/listings')
		expect(page).to have_content("Peacock Paradise Private Villa")
	end

end