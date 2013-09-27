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
  user = FactoryGirl.create(:user, :with_avatar)
  sign_in_as(user)

  save_and_open_page
  expect(page).to have_image user.avatar.thumb.url
end
end
