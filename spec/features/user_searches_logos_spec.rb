require 'spec_helper'

feature 'user searches logos', %Q{
  As a yologo visitor
  I want to search for logos by title
  So that I can view only the logos I am interested in'
  } do

  # Acceptance Criteria
  # * there is a search field on the navbar;
  # * I can enter a search query to search logos by title;
  # * matching logos are displayed on the index page.

  scenario 'can enter a title and view results' do
    logo_one = FactoryGirl.create(:logo, :with_logo, :approved, title: 'GE')
    logo_two = FactoryGirl.create(:logo, :with_logo, :approved, title: 'Launch Academy')
    logo_three = FactoryGirl.create(:logo, :with_logo, title: 'CVS')

    visit root_path
    expect(page).to have_content(logo_one.title)
    expect(page).to have_content(logo_two.title)
    expect(page).to_not have_content(logo_three.title)

    fill_in 'Title:', with: logo_one.title
    click_on 'Search'

    expect(page).to have_content(logo_one.title)
    expect(page).to_not have_content(logo_two.title)
    expect(page).to_not have_content(logo_three.title)
  end
end


