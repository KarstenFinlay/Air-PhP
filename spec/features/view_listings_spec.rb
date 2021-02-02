feature 'view listings on page' do
  scenario 'display all listings' do
    visit('/listings')
    expect(page).to have_content("Welcome to the listings page")
  end
end