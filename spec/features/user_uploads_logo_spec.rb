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
  # * If I don't specify all required information, 
  #   I get an error;
  # * If I specify the required information, 
  #   the information is saved;

scenario 'unauthenticated user attempts to upload logo' do
  visit new_logo_path
  expect(page).to have_content('You need to sign in or sign up before continuing.')
end

scenario 'authenticated user attempts to upload logo' do
  user = FactoryGirl.create(:user)
  sign_in_as(user)
  visit new_logo_path
  fill_in "Title", with: "Launch Academy"
  attach_file('logo_logo', "#{Rails.root}/spec/support/logo_images/launch_academy_logo.png")
  click_on "Create Logo"

  
end

end

