require'spec_helper'

feature 'user votes/comments on a review', %Q{
    As a registered User
    I want to vote on logo reviews
    So that bad comments are rewarded and vice versa.
    } do

# Acceptance Criteria:
# * Must be a registered user
# * user views reviews on the logo show page
# * can vote up or down for another users reviews
# * Can only vote up or down, not both.
# * User can only vote once per review.


    scenario'user votes on review' do
        user = FactoryGirl.create(:user)
        logo = FactoryGirl.create(:logo, :with_logo, :approved)

        sign_in_as(user)
        visit logos_path
        click_link 'Vote'
        expect(page).to have_content(logo.title)
        click_button('Like')
        fill_in "Comment", with: "NICE LOGO DUDE!"
        click_on "Comment"
        
        expect(page).to have_content(logo.reviews.first.comment)
    end


    scenario 'user comments on logo' do 
        
        logo=FactoryGirl.create(:logo, :with_logo, :approved)
        user=FactoryGirl.create(:user)

        visit root_path

        sign_in_as(user)
        click_link 'Vote'
        expect(page).to have_content(logo.title)

        find_button('Like').visible?
        click_button('Like')
        fill_in 'Comment', with: "Really great logo, here"
        click_button'Comment'

        expect(logo.reviews.first.comment).to eql("Really great logo, here")
    end
end