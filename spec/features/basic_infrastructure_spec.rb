feature 'testing infrastructure' do
scenario 'Displays home page' do
    visit ('/')
    expect(page).to have_content("Email")
    end
end
