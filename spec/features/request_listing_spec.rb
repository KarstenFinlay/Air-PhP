feature 'update request status in table' do
  scenario 'changes a request status to true' do
    visit ('/listings/new')
    fill_in "name",	with: "Test property"
    fill_in "price",	with: "99" 
    fill_in "description",	with: "5 bedroom house" 
    click_button "Submit"
    expect(page).to have_content("Test property - Available")
    click_button "Request to book"
    expect(page).to have_content("Test property - Unavailable")
  end
end
