require 'spec_helper'

feature "user uploads logo", %Q{
  As a designer
  I want to add a logo I like/created
  So that other yologo members can view the logo
} do

  # Acceptance Criteria
  # * I must be authenticated and authorized;
  # * I must specify  required information by filling out a form:
  # * I must specify image upload path
  # * I must specify company name
  # * I must specify logo category
  # * If I don't specify all required information,
  #   I get an error;
  # * If I specify the required information,
  #   the information is saved;

  scenario 'unauthenticated user attempts to upload logo' do
    visit new_logo_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario 'authenticated user attempts to upload logo' do
    count = Logo.count
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit new_logo_path
    fill_in "Title", with: "Launch Academy"
    attach_file('logo_logo', "#{Rails.root}/spec/support/logo_images/launch_academy_logo.png")
    click_on "Create Logo"

    expect(Logo.count).to eql(count +1)
    expect(current_path).to eql(root_path)
    expect(page).to have_content("Launch Academy")
  end

  #TODO: scenario to ensure the logo is valid

  scenario 'user gets error when form isnt filled' do
    count = Logo.count
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit new_logo_path
    click_on "Create Logo"

    expect(Logo.count).to eql(count)
    expect(page).to have_content("can't be blank")
  end

  scenario 'user uploads logo with category' do
    count = Logo.count
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit new_logo_path

    fill_in"Title", with: "Launch Academy"
    attach_file('logo_logo', "#{Rails.root}/spec/support/logo_images/launch_academy_logo.png")
    select "Technology", from: "Sector"
    click_on "Create Logo"

    expect(Logo.count).to eql(count + 1)
    expect(current_path).to eql(root_path)
    expect(page).to have_content("Launch Academy")
    expect(page).to have_content("Technology")
  end
end

