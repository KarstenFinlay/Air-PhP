feature 'update request status in table' do
  scenario 'changes a request status to true' do
    visit ('/listings/new')
    fill_in "name",	with: "Test property"
    click_button "Submit"
    expect(page).to have_content("Test property - Unrequested")

    click_button "Request to book"
    expect(page).to have_content("Test property - Requested")
  end
end
