require "faker"

FactoryGirl.define do
  factory :article do
  	chinese_title {Faker::Name.first_name}
  	franch_title  {Faker::Name.first_name}
  	chinese_content  {Faker::Lorem.sentence}
  	franch_content {Faker::Lorem.sentence}
  end
end