# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "#{n}jcameron"}
    sequence(:email) { |n| "#{n}jcameron@wb.com"}
    password "password"

    trait :with_avatar do 
      avatar { Rack::Test::UploadedFile.new(File.join(Rails.root,'spec', 'support', 'avatar_images', 'avatar.jpg'))}
    end
  end
end
