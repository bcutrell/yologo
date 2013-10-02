require 'spec_helper'

describe Logo do


  it{ should belong_to(:user) }
  it{ should have_many(:reviews) }
  
  it { should have_valid(:title).when("Launch Academy", "Starbucks") }
  it { should_not have_valid(:title).when("", nil) }
  #TODO: validate file types (jpg, gif, pngs only)
  it { should_not have_valid(:logo).when("", nil) }

end
