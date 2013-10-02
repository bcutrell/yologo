require'spec_helper'

feature 'user votes/comments on logo', %Q{
    As a user
    I want to be able to optionally review
    So that i can give my opinion to a logo

} do

#   Acceptance Criteria
# * The text box to review is present on each logo page
# * If i view the page, up-vote/down-vote, or just browse, it is NOT a requirement to leave a review (hence optionally).
# * Must be a user to review
# * Comment gets posted on the logo page
# * Gives no error if no review
# * Can only write a review if they vote
# * Review is optional--> Vote can be submitted with empty comment.

  scenario'user votes on logo' do
    user = FactoryGirl.create(:user)
    logo = FactoryGirl.create(:logo, :with_logo)
    vote = FactoryGirl.create(:vote)

    sign_in_as(user)

    prev_vote_count = logo.votes.count
    visit logos_path

    find('.image_link').click
    expect(page).to have_content(logo.logo)

    expect(page).to have_content('Vote')
    expect(page).to have_content('Comment')

    find('vote_up_img_link').click

    expect(logo.votes.count).to eql(prev_vote_count + 1)
  end
end