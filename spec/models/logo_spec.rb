require 'spec_helper'

describe Logo do
  it { should have_valid(:title).when("Launch Academy", "Starbucks") }
  it { should_not have_valid(:title).when("", nil) }

  #it { should have_valid(:logo).when() }
  it { should_not have_valid(:logo).when("", nil) }

end
