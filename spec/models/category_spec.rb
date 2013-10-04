require 'spec_helper'

describe Category do

  it {should have_many (:logos)}



  it {should have_valid(:name).when("Technology", "Healthcare")}
  it {should_not have_valid(:name).when(nil, " ", "Sausage")}


end
