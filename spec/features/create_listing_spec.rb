feature 'Creates property listing' do
  scenario 'Adds a listing to the page' do
      visit ('/listings/new')
      fill_in "name",	with: "Test property"
      click_button "Submit"
      expect(page).to have_content("Test property")
  end
end
