require 'spec_helper'

feature 'user uploads an avatar'  ,%Q{
As a yologian
I want to upload an avatar
So that I can display my personality via an image} do 

# Acceptance Criteria:
# * I will be able to upload an avatar when I create my account
# * I will be able to edit my account and upload an avatar after I create my account
# * If I upload a valid photo, it will be associated with my username
# * My image will default to a specific thumbnail size
# * Other yologians will see my avatar when I post a comment
# * If I try to upload an invalid photo, I will recieve an error message

  scenario 'I upload an avatar' do 


    visit new_user_registration_path
    fill_in 'Username', with: "ben"
    fill_in 'Email', with: "ben@yahoo.com"
    fill_in 'user_password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    attach_file('user_avatar', "#{Rails.root}/spec/support/avatar_images/avatar.jpg")
    click_button 'Sign up'

    expect(page).to have_image User.all.first.avatar.thumb.url
    expect(User.all.first.avatar).to_not eql(nil)
  end
end
