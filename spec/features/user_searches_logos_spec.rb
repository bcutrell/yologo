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

  let!(:logo_one) {FactoryGirl.create(:logo, :with_logo, :approved, title: 'GE')}
  let!(:logo_two) {FactoryGirl.create(:logo, :with_logo, :approved, title: 'Launch Academy')}
  let!(:logo_three) {FactoryGirl.create(:logo, :with_logo, title: 'CVS')}
  let!(:admin) {FactoryGirl.create(:user, :as_admin)}

  scenario 'unregistered user can enter a title and view results' do

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

  scenario 'admin can enter a title and view results' do

    sign_in_as(admin)

    visit root_path
    expect(page).to have_content(logo_three.title)
    expect(page).to_not have_content(logo_one.title)

    fill_in 'Title:', with: logo_three.title
    click_on 'Search'


    expect(page).to have_content(logo_three.title)
    expect(page).to_not have_content(logo_one.title)
  end

  scenario 'search result has no matches' do

    visit root_path
    expect(page).to have_content(logo_one.title)
    expect(page).to have_content(logo_two.title)
    expect(page).to_not have_content(logo_three.title)

    fill_in 'Title:', with: "stuff"
    click_on 'Search'

    expect(page).to have_content("There are no logos with that title.")
    expect(page).to_not have_content(logo_one.title)
    expect(page).to_not have_content(logo_two.title)
    expect(page).to_not have_content(logo_three.title)
  end
end


