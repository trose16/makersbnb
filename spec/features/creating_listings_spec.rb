require 'spec_helper'

RSpec.feature 'Creating a Listing', :type => :feature do

	scenario 'user can visit page to add a new listing' do
		visit '/listings/new'
		expect(page.status_code).to eq 200
	end

end