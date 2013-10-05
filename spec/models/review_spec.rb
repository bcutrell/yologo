require 'spec_helper'

describe Review do

it{ should belong_to(:logo) }
it{ should belong_to(:user) }
it{ should have_many(:votes) }

it "records the votes from the user" do 
  user = FactoryGirl.create(:user)
  logo = FactoryGirl.create(:logo, :with_logo)
  review = FactoryGirl.create(:review)
  params = { commit: "Like" }
  expect(Review.record_from_user(user,params,logo).vote).to eql(1)
  end
end
