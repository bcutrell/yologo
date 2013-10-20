require 'spec_helper'

describe User do

it{ should have_many(:votes) }
it{ should have_many(:logos) }
it{ should have_many(:reviews) }

it { should have_valid(:username).when("gentlebuffalo") }
it { should_not have_valid(:username).when("", nil) }

it { should have_valid(:email).when("bcutrell@gmail.com") }
it { should_not have_valid(:email).when("bcutrell", "12345", 12345, nil) }

it { should have_valid(:password).when("password") }
it { should_not have_valid(:password).when("", nil) }

    describe "review_score_for_logo" do
      it 'calculates 0 if the user has not voted' do
        logo = FactoryGirl.create(:logo, :with_logo, :approved)
        user = FactoryGirl.create(:user)

        expect(user.review_score_for_logo(logo)).to eql(0)
      end

      it 'calculates 1 if the user has voted like' do
        logo = FactoryGirl.create(:logo, :with_logo, :approved)
        user = FactoryGirl.create(:user)
        review = FactoryGirl.create(:review, logo: logo, user: user)

        expect(user.review_score_for_logo(logo)).to eql(1)
      end
    end
end

describe AvatarUploader do
  its(:extension_white_list) { should =~ %w(jpg jpeg gif png) }
end
