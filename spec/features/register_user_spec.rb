feature 'User is able to register to AirPhp' do
  scenario 'Allows a user to register' do
    visit ('/users/new')
    fill_in "email", with: "email@email.com"
    fill_in "password", with: "password"
    click_button "Register"
    expect(page).to have_content("Welcome, email@email.com")
  end
end
