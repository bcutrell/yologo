require 'spec_helper'

describe Review do

it{ should belong_to(:logo) }
it{ should belong_to(:user) }
it{ should have_many(:votes) }

end
