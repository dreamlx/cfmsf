require "faker"

FactoryGirl.define do
  factory :article do
   	association :category
  	chinese_title {Faker::Name.first_name}
  	french_title  {Faker::Name.first_name}
  	chinese_content  {Faker::Lorem.sentence}
  	french_content {Faker::Lorem.sentence}
  end
end