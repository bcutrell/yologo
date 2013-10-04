require 'spec_helper'

describe Categorization do
  it {should belong_to (:logo)}
  it {should belong_to (:category)}

  it {should have_valid(:logo_id).when(1, 2)}
  it {should_not have_valid(:logo_id).when(nil, " ", "hot")}

  it {should have_valid(:category_id).when(1, 2)}
  it {should_not have_valid(:category_id).when(nil, " ", "hot")}


end
