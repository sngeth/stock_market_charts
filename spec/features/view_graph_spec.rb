require 'rails_helper'


feature "Viewing graphics", :type => :feature do
  scenario "Displays the recent trend lines for each added stock", js: true do
    visit '/'

    fill_in :symbol, with: "AAPL"
    click_button "Search"

    expect(page).to have_text("AAPL")
  end
end
