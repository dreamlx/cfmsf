require 'faker'

FactoryGirl.define do
  factory :user do
  	password "11111111"
	factory :admin do
  	  username "admin"
	  role "admin"
	end

	factory :editor do
	  username "editor"
      role "editor"
	end  	
  end
end