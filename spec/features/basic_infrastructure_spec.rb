feature 'testing infrastructure' do
scenario 'Displays home page' do
    visit ('/')
    expect(page).to have_content("Hello World!")
    end
end