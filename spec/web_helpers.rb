module WebHelpers

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

# methods for testing here
  def create_listing( name:        "Peacock Paradise Private Villa",
                      description: "My home has peacocks and a pool.",
                      price:       "50",
                      available_from:  "12/12/2016",
                      available_until: "22/04/2017" )
    visit '/listings/new'
    fill_in :name, with: name
    fill_in :description, with: description
    fill_in :price, with: price
    fill_in :available_from, with: available_from
    fill_in :available_until, with: available_until
    click_button "List my Property"
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

def correct_log_in
  visit '/sessions/new'
  fill_in "email", with:  'jane@email.com'
  fill_in "password", with: 'abcd1234'
  click_button 'log-in'
end

def incorrect_log_in
  visit '/sessions/new'
  fill_in "email", with:  'jane@email.com'
  fill_in "password", with: 'abcd4'
  click_button 'log-in'
end

end
