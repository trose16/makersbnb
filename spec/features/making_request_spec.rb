require 'spec_helper'

feature 'Requesting a listing' do

include WebHelpers

  scenario "user can request a property" do
    make_request
    expect(current_path).to eq "/users/requests"
  end

  scenario "Saves requests to the database" do
    expect{make_request}.to change{Request.count}.by(1)
  end

end
