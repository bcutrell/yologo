FactoryGirl.define do
  factory :logo do
    sequence(:title) { |n| "company#{n}"}

    trait :with_logo do
      logo { Rack::Test::UploadedFile.new(File.join(Rails.root,'spec', 'support', 'logo_images', 'launch_academy_logo.png'))}
    end
  end
end
