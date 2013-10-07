require'spec_helper'

feature 'user votes/comments on a review', %Q{
    As a registered User
    I want to vote on logo reviews
    So that good comments are rewarded and vice versa.
    } do

# Acceptance Criteria:
# * Must be a registered user
# * user views reviews on the logo show page
# * can vote up or down for another users reviews
# * Can only vote up or down, not both.
# * User can only vote once per review.

    scenario'user votes rad on review' do

        user = FactoryGirl.create(:user)
        logo = FactoryGirl.create(:logo, :with_logo, :approved)

        sign_in_as(user)
        visit logos_path
        click_link 'Vote'
        expect(page).to have_content(logo.title)
        click_button('Like')
        fill_in "Comment", with: "NICE LOGO DUDE!"
        click_on "Comment"
        click_on('Rad')

        new_vote = Vote.first

        expect(new_vote.rating).to eql(1)
        expect(new_vote.user_id).to eql(user.id)
        expect(new_vote.review_id).to eql(logo.reviews.first.id)
    end
end
