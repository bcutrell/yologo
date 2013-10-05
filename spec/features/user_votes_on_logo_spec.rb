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
        logo = FactoryGirl.create(:logo, :with_logo, :approved)

        sign_in_as(user)
        visit logos_path
        click_link 'Vote'
        expect(page).to have_content(logo.title)
        click_button('Like')

        expect(logo.reviews.sum("vote")).to eql(1)
        expect(page).to have_content(logo.reviews.sum("vote"))
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

    scenario 'user can only vote up once or down once' do 
        user = FactoryGirl.create(:user)
        logo = FactoryGirl.create(:logo, :with_logo, :approved)

        sign_in_as(user)
        visit logos_path
        click_link 'Vote'
        expect(page).to have_content(logo.title)
        click_button('Like')

        expect(logo.reviews.sum("vote")).to eql(1)
        expect(page).to_not have_content("Like")
    end
end