require 'spec_helper'

describe Vote do

  it{should belong_to(:user)}
  it{should belong_to(:review)}

  it{should have_valid(:user_id).when(1,2)}
  it{should_not have_valid(:user_id).when(nil, " ")}

  it{should have_valid(:review_id).when(1,2)}
  it{should_not have_valid(:review_id).when(nil, " ")}

  it{should have_valid(:vote).when(1, -1)}
  it{should_not have_valid(:vote).when(nil, 'hello')}

end

end
