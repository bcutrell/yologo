require 'spec_helper'

feature "admin reviews logos", %Q{
  As an Admin
  I want to see the logo before it is on site
  So that i can ensure quality logos be displayed
} do

# Acceptance Criteria
# * When user uploads image, it does not immediately get displayed. 
# * When user uploads image, admin can view images
# * Admin must authorize( yes or no)  on logo
# * If admin says "yes", logo is displayed on site
# * If admin says "no", logo is deleted. 

  scenario 'admin reviews a logo' do
    logo = FactoryGirl.create(:logo, :with_logo)
    admin = FactoryGirl.create(:user, :as_admin)

    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'

    visit root_path
    expect(logo.state).to eql('submitted')
    expect(page).to have_content(logo.title)
    select('approved', :from => 'State')
    click_on 'Update Logo'
    expect(logo.approve).to eql(true)
    expect(logo.state).to eql('approved')

  end

  scenario 'user cannot see unreviewed logos' do
    logo = FactoryGirl.create(:logo, :with_logo)
    user = FactoryGirl.create(:user)

    visit root_path
    expect(logo.state).to eql('submitted')
    expect(page).to_not have_content(logo.title)
  end

end
