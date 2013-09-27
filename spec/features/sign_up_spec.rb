require 'spec_helper'

feature 'something' do

end

feature 'sign up' do
  # Acceptance Criteria:
  # * I must specify a valid email address, first name, and last name
  # * I must specify a password, and confirm that password
  # * If I do not perform the above, I get an error message
  # * If I specify valid information, I register my account and am authenticated
  scenario 'with valid information' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Username', with: 'John'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'
    expect(page).to have_content("Welcome to Yologo")
    expect(page).to have_content('Sign Out')
  end

  scenario 'with missing information' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'
    expect(page).to have_content("can't be blank")
  end

  scenario 'with a conflicting password confirmation' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'something different'
    click_button 'Sign Up'
    expect(page).to have_content("doesn't match")
  end

end