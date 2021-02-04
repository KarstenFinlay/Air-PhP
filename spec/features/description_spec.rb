feature 'Adding descriptions' do
  scenario 'users able to see descriptions' do
    visit ('/listings/new')
    fill_in "name",	with: "Test property"
    fill_in "description",	with: "5 bedroom house"
    click_button "Submit"
    expect(page).to have_content("5 bedroom house")
  end
end
