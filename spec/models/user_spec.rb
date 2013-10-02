require 'spec_helper'

describe User do
#TODO: test some validations

it{ should have_many(:votes) }
it{ should have_many(:logos) }
it{ should have_many(:reviews) }

end
