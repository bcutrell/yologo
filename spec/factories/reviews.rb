# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    user_id 1
    logo_id 1
    comment "MyText"
    vote 1
  end
end
