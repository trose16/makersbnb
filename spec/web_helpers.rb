def sign_up
  visit "/users/new"
  fill_in "name", with: "Jane"
  fill_in "email", with: "jane@email.com"
  fill_in "password", with: "abcd1234"
  fill_in "password_confirm", with: "abcd1234"
  click_button "submit"
end
