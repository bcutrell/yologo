require 'spec_helper'

describe Seeders::Logos do
  let (:seeder) {Seeders::Logos}

  it 'seeds logos' do
    seeded_logo = seeder.logos.first[:title]
    seeder.seed
    expect(Logo.where(title: seeded_logo)).to be_present
  end

  it 'does not create duplicates' do
    seeder.seed
    count_after_seed = Logo.count
    seeder.seed
    expect(Logo.count).to  eql(count_after_seed)
  end

end
