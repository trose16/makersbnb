def sign_up
  visit "/users/new"
  fill_in "name", with: "Jane"
  fill_in "email", with: "jane@email.com"
  fill_in "password", with: "abcd1234"
  fill_in "password_confirm", with: "abcd1234"
  click_button "submit"
end

def invalid_email_sign_up
  visit "/users/new"
  fill_in "name", with: "Jane"
  fill_in "email", with: "not_an_email"
  fill_in "password", with: "abcd1234"
  fill_in "password_confirm", with: "abcd1234"
  click_button "submit"
end

def no_match_password_sign_up
  visit "/users/new"
  fill_in "name", with: "Jane"
  fill_in "email", with: "jane@gmail.com"
  fill_in "password", with: "abcd1234"
  fill_in "password_confirm", with: "abcd"
  click_button "submit"
end

def no_email_sign_up
  visit "/users/new"
  fill_in "name", with: "Jane"
  fill_in "email", with: ""
  fill_in "password", with: "abcd1234"
  fill_in "password_confirm", with: "abcd1234"
  click_button "submit"
end

def no_password_sign_up
  visit "/users/new"
  fill_in "name", with: "Jane"
  fill_in "email", with: "jane@gmail.com"
  fill_in "password", with: ""
  fill_in "password_confirm", with: ""
  click_button "submit"
end
