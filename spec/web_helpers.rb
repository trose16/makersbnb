module WebHelpers

  def sign_up_owner(name: "Jane",
                email: "jane@email.com",
                password: "abcd1234",
                password_confirm: "abcd1234")
    visit "/users/new"
    fill_in "name", with: name
    fill_in "email", with: email
    fill_in "password", with: password
    fill_in "password_confirm", with: password_confirm
    click_button "submit"
  end

  def sign_up_renter(name: "Sam",
                      email: "sam@email.com",
                      password: "efgh5678",
                      password_confirm: "efgh5678")
    visit "/users/new"
    fill_in "name", with: name
    fill_in "email", with: email
    fill_in "password", with: password
    fill_in "password_confirm", with: password_confirm
    click_button "submit"
  end

  def create_listing( name:        "Peacock Paradise Private Villa",
                      description: "My home has peacocks and a pool.",
                      price:       "50",
                      location_city: "London",
                      location_country: "United Kingdom",
                      available_from:  "12/12/2016",
                      available_until: "22/04/2017" )
    visit '/listings/new'
    fill_in :name, with: name
    fill_in :description, with: description
    fill_in :price, with: price
    fill_in :city, with: location_city
    fill_in :country, with: location_country
    fill_in :available_from, with: available_from
    fill_in :available_until, with: available_until
    click_button "List my Property"
  end


  def log_in_owner(email: "jane@email.com",
              password: "abcd1234")
    visit '/sessions/new'
    fill_in "email", with:  email
    fill_in "password", with: password
    click_button 'log-in'
  end

  def log_in_renter(email: "sam@email.com",
              password: "efgh5678")
    visit '/sessions/new'
    fill_in "email", with:  email
    fill_in "password", with: password
    click_button 'log-in'
  end

  def log_out
    click_button('Log out')
  end

  def make_request
    sign_up_owner
    log_in_owner
    create_listing
    log_out
    sign_up_renter
    log_in_renter
    click_link('Peacock Paradise Private Villa')
    expect(page).to have_selector(:link_or_button, 'Request')
    click_button 'Request'
  end

end
