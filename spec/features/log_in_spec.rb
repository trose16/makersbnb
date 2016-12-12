require_relative "../web_helpers.rb"

feature 'Log in' do
  scenario 'Loggin in with correct creds takes you to listings page' do
    sign_up
    visit '/sessions/new'
    fill_in "email", with:  'jane@email.com'
    fill_in "password", with: 'abcd1234'
    click_button 'log-in'
    expect(page).to have_content 'Listings'
  end

end
