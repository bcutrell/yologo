require 'spec_helper'

describe User do
#TODO: test some validations

it{ should have_many(:votes) }
it{ should have_many(:logos) }
it{ should have_many(:reviews) }

it { should have_valid(:username).when("gentlebuffalo") }
it { should_not have_valid(:username).when("", nil) }

it { should have_valid(:email).when("bcutrell@gmail.com") }
it { should_not have_valid(:email).when("bcutrell", "12345", 12345, nil) }

it { should have_valid(:password).when("password") }
it { should_not have_valid(:password).when("", nil) }

end

describe AvatarUploader do

  its(:extension_white_list) { should =~ %w(jpg jpeg gif png) }

end