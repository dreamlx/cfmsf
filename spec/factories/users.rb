require 'faker'

FactoryGirl.define do
  factory :user do
  	password "11111111"
  	username{Faker::Name.first_name}
	factory :admin do
	  role "admin"
	end

	factory :editor do
      role "editor"
	end  	
  end
end