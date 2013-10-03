require 'spec_helper'

feature "user views logos", %Q{
  As a person interested in design
  I want to view logos
  So that I can see them all
} do

  # * There is a page that lists all logos, displaying title and picture;
  # * Logos are displayed with pagination;
  # * I don't have to be authenticated to view the page;

  scenario 'unauthenticated user views logos' do
    logo = FactoryGirl.create(:logo, :with_logo, :approved)
    visit root_path
    expect(page).to have_content(logo.title)
  end

  scenario 'authenticated user views logos' do
    logo = FactoryGirl.create(:logo, :with_logo, :approved)
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit root_path
    expect(page).to have_content(logo.title)
  end

end
