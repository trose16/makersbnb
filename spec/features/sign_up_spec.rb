require_relative "../web_helpers.rb"
require_relative "../spec_helper.rb"

feature "Sign up" do

  scenario "User can enter their details and account is added to database" do
    expect{sign_up}.to change{User.count}.by(1)
  end

  scenario "User has to sign up with a valid email" do
    expect{invalid_email_sign_up}.to change{User.count}.by(0)
  end

  scenario "User passwords have to match" do
    expect{no_match_password_sign_up}.to change{User.count}.by(0)
  end

  scenario "User cannot sign up without entering a password" do
    expect{no_password_sign_up}.to change{User.count}.by(0)
  end

  scenario "User cannot sign up without an email" do
    expect{no_email_sign_up}.to change{User.count}.by(0)
  end

  scenario "User email must be unique" do
    sign_up
    expect{sign_up}.to change{User.count}.by(0)
  end

end
