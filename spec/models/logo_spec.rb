require 'spec_helper'

describe Logo do


  it{ should belong_to(:user) }
  it{ should have_many(:reviews) }
  
  it { should have_valid(:title).when("Launch Academy", "Starbucks") }
  it { should_not have_valid(:title).when("", nil) }
  it { should_not have_valid(:logo).when("", nil) }

end

describe LogoUploader do

  its(:extension_white_list) { should =~ %w(jpg jpeg gif png) }

end