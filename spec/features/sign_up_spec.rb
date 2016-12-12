require_relative "../web_helpers.rb"
require_relative "../spec_helper.rb"

feature "Sign up" do

  scenario "User can enter their details and account is added to database" do
    sign_up
    expect{sign_up}.to change{User.count}.by(1)
  end

end
